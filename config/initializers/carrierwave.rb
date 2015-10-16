CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAI33YQDGGY37DX5DQ',
      :aws_secret_access_key  => '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',
      :region                 => 'ap-southeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = 'inspaze'
end