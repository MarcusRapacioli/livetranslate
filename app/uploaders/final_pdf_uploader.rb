class FinalPdfUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
