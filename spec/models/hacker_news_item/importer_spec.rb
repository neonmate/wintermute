describe HackerNewsItem::Importer do

  describe '#import' do
    it 'imports items from the Hackernews API', vcr: { cassette_name: 'hacker_news_item_importer/import' } do
      expect { described_class.new.import(limit: 10, bulk_size: 2) }.to change(HackerNewsItem, :count).from(0).to(10)
      expect(HackerNewsItem.last).to have_attributes(
        identifier: 10,
        deleted: false,
        type: 'story',
        by: 'frobnicate',
        time: Time.parse('2006-10-09 21:21:14 +0200'),
        text: nil,
        dead: false,
        parent_id: nil,
        poll_id: nil,
        kids: ['454419'],
        url: 'http://www.techcrunch.com/2006/10/09/broadcast-photos-to-cable-tv/',
        score: 3,
        title: 'PhotoShow: Broadcast Photos to Cable TV',
        parts: [],
        descendants: 0,
      )
    end
  end

end
