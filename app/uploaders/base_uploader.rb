class BaseUploader < CarrierWave::Uploader::Base

  def store_dir
    Rails.root.join(
      'public',
      'system',
      environment_path,
      *model_paths,
      secret_path
    )
  end

  def cache_dir
    Rails.root.join('tmp', environment_path)
  end

  private

  def model_paths
    [
      model.class.table_name,
      mounted_as,
      *padded_id_paths,
    ].map(&:to_s)
  end

  def secret_path
    hashed_parts = [*model_paths, environment_secret].map do |part|
      Digest::SHA256.hexdigest(part)
    end

    Digest::SHA256.hexdigest(hashed_parts.join)
  end

  def environment_path
    ENV['RAILS_UPLOADER_ENVIRONMENT'] || "#{Rails.env}#{ENV['TEST_ENV_NUMBER']}"
  end

  def environment_secret
    ENV['RAILS_UPLOADER_SECRET'] || Rails.application.secrets.secret_uploader_key
  end

  # Since there might be a large number of uploads, it makes sense to split the attributes folder into a nested
  # structure that allows a better perfomance on Linux systems.
  #
  # Examples:
  #   model/attachments/1234567890 => model/attachments/1234/567/890
  #   model/attachments/123456789 => model/attachments/123/456/789
  #   model/attachments/1 => model/attachments/000/000/001
  def padded_id_paths
    namespaced_id = model.id.to_s
    namespaced_id = namespaced_id.rjust(9, '0')
    namespaced_id.match(/(\d+)(\d{3})(\d{3})/).captures
  end

end
