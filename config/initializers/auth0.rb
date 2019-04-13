Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'ElwA2fOcw7nMKuCZXUahwtgKbFxcqVUi',
    'YymLH_8c_djq2wrE4ZnGqdEC9UfOSb6z7cEbqGfhZYn2CcFfhT920F1CFTY-AURi',
    'careerquestions.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid profile'
    }
  )
end
