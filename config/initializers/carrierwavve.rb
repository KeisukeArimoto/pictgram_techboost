require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ENV[keisukearimoto]
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV[AKIAV4MVJPN55HRRTXXN],
    aws_secret_access_key: ENV[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],
    region: ENV[ap-northeast-1],
    path_style: true
  }
end