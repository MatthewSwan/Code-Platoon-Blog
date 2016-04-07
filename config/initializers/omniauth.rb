# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
   ENV['GITHUB_KEY'] = 'c9949bea1ff1e9f270ed'
   ENV['GITHUB_SECRET'] = 'ba1bce0f7b80f829882e4fb774aac97ab5d6d3cd'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,user:follow"
end
