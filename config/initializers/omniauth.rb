Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, '1431998786817415', 'cb36f853f2fb7447999156da8de0d2a9',
  scope: 'email,public_profile,user_about_me', info_fields: 'name,email,gender'
  # provider :github, '41b460aeb5ec27cf80ed', 'd57e0f17371a4122f3e7057d53b29e7e37d3ba4c'

end
