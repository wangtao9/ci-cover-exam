require 'simplecov'

# Check to see if we're inside a CI environment. If not, we don't want to override the default formatter.
if ENV['CI']
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

# The NO_COVERAGE clause is optional - Coveralls and CircleCI don't use it by default, but may be useful for you in other circumstances.
SimpleCov.start 'rails' unless ENV.key?('NO_COVERAGE')
