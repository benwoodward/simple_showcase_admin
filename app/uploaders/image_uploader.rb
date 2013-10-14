# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp tiff)
  end

  def filename
    !super.nil? ? super.chomp(File.extname(super)) + '.png' : super
  end

  process :resize_to_fit => [750, 502]
  process :convert => 'png'

end
