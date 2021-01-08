class HackerNewsItem
  class Importer
    DEFAULT_BULK_SIZE = 1_000
    DEFAULT_LIMIT = 1_000_000
    NULLBYTE_SEQUENCE = "\u0000".freeze

    attr_accessor :base_url, :client

    def initialize
      self.base_url = 'https://hacker-news.firebaseio.com'
      self.client = Typhoeus::Hydra.new
    end

    def import(limit: DEFAULT_LIMIT, bulk_size: DEFAULT_BULK_SIZE)
      missing_items.first(limit).each_slice(bulk_size) do |ids|
        benchmark = Benchmark.measure do
          ActiveRecord::Base.transaction do
            ids.each_slice(100) do |request_ids|
              raw_bodies = get(request_ids.map { |id| "item/#{id}" })

              raw_bodies.each do |raw_body|
                body = JSON.parse(raw_body)
                next if body['time'].nil? # e.g. https://news.ycombinator.com/item?id=78692

                attributes = {
                  identifier: body.fetch('id'),
                  deleted: body.fetch('deleted', false),
                  type: body.fetch('type'),
                  by: body.fetch('by', nil),
                  time: Time.at(body.fetch('time')),
                  text: sanitize_text(body.fetch('text', nil)),
                  dead: body.fetch('dead', false),
                  parent_id: body.fetch('parent', nil),
                  poll_id: body.fetch('poll', nil),
                  kids: body.fetch('kids', []),
                  url: body.fetch('url', nil),
                  score: body.fetch('score', 0),
                  title: body.fetch('title', nil),
                  parts: body.fetch('parts', []),
                  descendants: body.fetch('descendants', 0),
                }

                item = HackerNewsItem.new(**attributes)
                item.save!
              rescue KeyError
                Rails.logger.info(<<~TEXT)
                  Could not save item with ID #{body.fetch('id')} and the following response:
                  #{body.inspect}
                TEXT

                raise # re-raise
              rescue ActiveRecord::RecordInvalid
                Rails.logger.info(<<~TEXT)
                  Could not save item with ID #{body.fetch('id')} and the following attributes:
                  #{attributes.inspect}

                  Response:
                  #{body.inspect}

                  Errors:
                  #{item.errors.full_messages.join("\n")}
                TEXT

                raise # re-raise
              end
            end
          end
        end

        remaining_days = (max_item / bulk_size * benchmark.real / 60 / 60 / 24).round(2)
        Rails.logger.info("#{Time.now} Fetched ID #{ids.first} - #{ids.last} (#{benchmark.real.round(2)}s, remaining #{remaining_days} days)")
      end
    end

    private

    def missing_items
      current_max_item = HackerNewsItem.maximum(:identifier) || 0

      ((current_max_item + 1)..max_item)
    end

    def max_item
      @max_item ||= get(['maxitem']).first.to_i
    end

    def get(paths)
      requests = paths.map do |path|
        request = Typhoeus::Request.new(
          "#{base_url}/v0/#{path}.json",
          headers: {
            'Accept' => 'application/json',
            'Content-Type' => 'application/json'
          },
          followlocation: true
        )
        client.queue(request)

        request
      end

      client.run

      requests.each do |request|
        if request.response.failure?
          raise(<<~TEXT)
            Request #{path} was not successful.
            Error code: #{request.response.code}
            Body: #{request.response.body}
          TEXT
        end
      end

      requests.map { |request| request.response.body }
    end

    def sanitize_text(text)
      return if text.blank?

      text.gsub(NULLBYTE_SEQUENCE, '')
    end

  end
end
