Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, FACEBOOK_CONFIG['FACEBOOK_APP_ID'], FACEBOOK_CONFIG['FACEBOOK_SECRET'], :scope => 'email,user_birthday,read_stream,user_photos,read_friendlists '

 OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
 }

end
