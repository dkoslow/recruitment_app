Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CAL_ID'], ENV['GOOGLE_CAL_SECRET'], {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    redirect_uri: 'http://localhost/auth/google_oauth2/callback'
  }
end