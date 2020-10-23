describe ExternalRepositoryReview::Importer do

  describe '#import_non_existing' do
    it 'imports all non existing external repositories for reviewing', vcr: { cassette_name: 'external_repository_review_importer/paginated_request' } do
      stub_const("#{ExternalRepositoryReview::Importer}::LIMIT", 2)
      # We filter the query with the term "thoughtbot" to have only a few pages
      stub_const(
        "#{ExternalRepositoryReview::Importer}::SEARCH_QUERY",
        "#{ExternalRepositoryReview::Importer::SEARCH_QUERY} thoughtbot"
      )
      create(
        :external_repository_review,
        identifier: 'thoughtbot/factory_bot',
        homepage_url: 'https://example.com/already_exists'
      )

      described_class.new.import_non_existing

      expect(ExternalRepositoryReview.pluck(:identifier, :homepage_url)).to eq(
        [
          ['thoughtbot/factory_bot', 'https://example.com/already_exists'],
          ['thoughtbot/clearance', 'https://thoughtbot.com'],
          ['thoughtbot/appraisal', 'https://thoughtbot.com'],
          ['thoughtbot/constable', 'https://constable.io'],
          ['krobertson/dm-paperclip', 'http://github.com/krobertson/dm-paperclip']
        ]
      )
    end
  end

end
