APP_LIB = File.expand_path(File.dirname(__FILE__) + '/../lib')

$LOAD_PATH.unshift(APP_LIB).uniq!

Dir["#{APP_LIB}/**/*.rb"].each {|file| require file }


RSpec.configure do |config|
  config.mock_with :rspec
end


