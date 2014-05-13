# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  config.include Capybara::DSL

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({'provider' => 'twitter',
                                         'uid' => '123545',
                                         'info' => OmniAuth::AuthHash.new( {
                                            'nickname' => "DeepaliChaudha1",
                                            'name' => "Deepali Chaudhary",
                                            'image' => "http://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png",
                                            'urls' => OmniAuth::AuthHash.new({"Twitter" => "https://twitter.com/DeepaliChaudha1"})
                                          }),
                                         'extra' => OmniAuth::AuthHash.new({
                                          "access_token" => OmniAuth::AuthHash.new({
                                            "token" => "1243267070-fANkac4xM040NlLQtWZcLvybbINvyu8GgICKdBX",
                                            "secret" => "MFl6NIUakfOMiD8iiEibpeeVHMRaR2CbO8XjE7GiKCVOi"
                                           })
                                         })
                                        })
end
