class ImageUploader < BaseUploader
  include CarrierWave::MiniMagick

  DEFAULT_IMAGE_FORMAT = 'jpg'.freeze

  def extension_allowlist
    ['jpg', 'jpeg', 'png']
  end

  def content_type_allowlist
    ['image/jpeg', 'image/png']
  end

  process convert: DEFAULT_IMAGE_FORMAT

  # https://makandracards.com/makandra/64832-carrierwave-always-limit-images-to-a-reasonable-size
  process resize_to_limit: [3000, 3000]

  # The image is cropped either in the width or the height
  version :medium do
    process resize_to_fill: [850, 450]
  end

  # The image is cropped either in the width or the height
  version :small do
    process resize_to_fill: [425, 225]
  end

  # https://github.com/carrierwaveuploader/carrierwave/tree/13330a70323cde83b319520f5c1874227de79cdf#using-rmagick
  def filename
    return if original_filename.blank?

    super.chomp(File.extname(super)) + ".#{DEFAULT_IMAGE_FORMAT}"
  end

end
