describe BaseUploader do

  before do
    example_record = Class.new(ActiveType::Object) do
      attribute :id
      attribute :attachment

      mount_uploader :attachment, BaseUploader
    end

    stub_const('ExampleRecord', example_record)
  end

  describe '#store_dir' do
    it 'stores the files in a public and unguessable directory' do
      example_record = ExampleRecord.create!(
        id: 1,
        attachment: file_fixture('example_1.txt').open
      )

      # Note: 'objects' is table name of the example record that does not have a database backend
      expect(example_record.attachment.url).to eq(
        "/system/test#{ENV['TEST_ENV_NUMBER']}/objects/attachment/000/000/001/6cfde3a364432ed0eb2925b10fc5d3da58c78a40460806aa6ffec67a4a22fa8a/example_1.txt"
      )
    end

    it 'pads the model IDs when the ID is smaller than 9 digits' do
      example_record = ExampleRecord.create!(
        id: 1,
        attachment: file_fixture('example_1.txt').open
      )

      expect(example_record.attachment.url).to include('/000/000/001/')
    end

    it 'does not pad the model IDs when the ID is excact 9 digits' do
      example_record = ExampleRecord.create!(
        id: 123_456_789,
        attachment: file_fixture('example_1.txt').open
      )

      expect(example_record.attachment.url).to include('/123/456/789/')
    end

    it 'allows IDs larger than 9 digits' do
      example_record = ExampleRecord.create!(
        id: 1_234_567_890,
        attachment: file_fixture('example_1.txt').open
      )

      expect(example_record.attachment.url).to include('/1234/567/890/')
    end
  end

end
