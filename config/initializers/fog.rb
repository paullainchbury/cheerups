CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIPIP6INGQGXYYEVA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'eu-west-1'                 # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }

  # config.cache_dir = "#{Rails.root}/tmp/uploads"

  config.fog_directory  = 'cheerup'                     # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end