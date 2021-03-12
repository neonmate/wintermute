describe ImageUploader, type: :uploader do

  before do
    example_record = Class.new(ActiveType::Object) do
      attribute :image

      mount_uploader :image, ImageUploader
    end

    stub_const('ExampleRecord', example_record)
  end

  describe '#extension_allowlist' do
    it 'allows .jpg, .jpeg and .png' do
      ['jpg', 'jpeg', 'png'].each do |extension|
        example_record = ExampleRecord.new(
          image: file_fixture("image_1.#{extension}").open
        )

        expect(example_record).to be_valid
      end
    end

    it 'does not allow any other extension' do
      example_record = ExampleRecord.new(
        image: file_fixture('example_1.txt').open
      )

      expect(example_record).not_to be_valid
      expect(example_record.errors[:image]).to contain_exactly(
        'You are not allowed to upload "txt" files, allowed types: jpg, jpeg, png'
      )
    end
  end

  describe '#content_type_allowlist' do
    it 'allows image/jpeg and image/png content types' do
      ['jpeg', 'png'].each do |type|
        file = Rack::Test::UploadedFile.new(
          file_fixture("image_1.#{type}"),
          "image/#{type}"
        )

        example_record = ExampleRecord.new(image: file)

        expect(example_record).to be_valid
      end
    end

    it 'does not allow any other content types' do
      file = Rack::Test::UploadedFile.new(
        file_fixture('image_1.jpg'),
        'text/plain'
      )

      example_record = ExampleRecord.new(image: file)

      expect(example_record).not_to be_valid
      expect(example_record.errors[:image]).to contain_exactly(
        'You are not allowed to upload text/plain files, allowed types: image/jpeg, image/png'
      )
    end
  end

  describe 'source image type convertion' do
    it 'converts all images to jpg' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_1.png').open
      )

      expect(example_record.image.file.filename).to eq('image_1.jpg')
    end
  end

  describe 'source image size convertion' do
    it 'resizes too wide images and keeps the proportions' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_w3002_h1501.jpg').open
      )

      expect(example_record.image).to have_dimensions(3000, 1500)
    end

    it 'resizes too high images and keeps the proportions' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_w1501_h3002.jpg').open
      )

      expect(example_record.image).to have_dimensions(1500, 3000)
    end

    it 'does not resize images that are with the valid contraints and keeps the proportions' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_w10_h10.jpg').open
      )

      expect(example_record.image).to have_dimensions(10, 10)
    end
  end

  describe '#versions' do

    it 'creates a medium version' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_w10_h10.jpg').open
      )

      expect(example_record.image.medium).to have_dimensions(850, 450)
    end

    it 'creates a small version' do
      example_record = ExampleRecord.create!(
        image: file_fixture('image_w10_h10.jpg').open
      )

      expect(example_record.image.small).to have_dimensions(425, 225)
    end

  end

end
