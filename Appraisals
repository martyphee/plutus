appraise 'rails_42' do
  gemspec

  gem 'rails', '4.2.8'
  gem 'jquery-ui-rails', '~> 5.0'

  gem 'activerecord-jdbcsqlite3-adapter', platforms: :jruby
end

appraise 'rails_50' do
  gemspec

  gem 'rails', '5.0.2'
  gem 'jquery-ui-rails', '~> 5.0'

  gem 'activerecord-jdbcsqlite3-adapter',
      git: 'https://github.com/jruby/activerecord-jdbc-adapter',
      branch: 'rails-5',
      platforms: :jruby
end