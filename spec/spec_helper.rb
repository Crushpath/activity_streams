$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'activity_streams'


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file, read=false)
  file = File.new(fixture_path + '/' + file)
  return File.read(file) if read
  file
end

Mongoid.configure do |config|
  config.sessions = {:default => {:hosts => ["localhost:27017"], :database => "activity_streams_test"}}
end

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.before(:each) do
    Mongoid.purge!
  end
end
