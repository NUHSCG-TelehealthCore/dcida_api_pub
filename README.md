# DCIDA API

Dynamic Computer Interactive Decision Application (DCIDA) is a dynamic CMS-like decision
aid tool that can be used to make customizable decision aids. This is the API for DCIDA.

## Dependencies (for development, on Mac OS X)
I recommend using homebrew to manage as many dependencies as you can (http://brew.sh/), and rvm for ruby management
* Ruby 2.2.0 (see https://rvm.io/)
* ImageMagick 6.9.1-10 (use homebrew)
* Postgresql 9.4.4 (use homebrew)
* Redis 3.0.3 (use homebrew)
* Foreman 0.78.0 (`gem install foreman`)

## API Setup
1. Create the database, and run database migrations
  1. `bundle exec rake db:create`
  2. `bundle exec rake db:migrate`
2. Create an admin superuser
  1. `bundle exec rake admin:create_user['admin@example.com','my_fun_password',true]`
    - The parameters to admin:create_user are:
      - email: string (required)
      - password: string (required)
      - is_superadmin: bool (required) - superadmin has full control over all decision aids
3. Start the development server
  1. `foreman start`

At this point, you should have Rails running on WEBrick at http://localhost:3000, along with Redis running in standalone mode and Sidekiq booted alongside Rails.


