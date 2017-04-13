system "rails g plutus"
rake "db:drop db:create db:migrate", env: 'development'
rake "db:drop db:create db:migrate", env: 'test'