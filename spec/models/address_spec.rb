require 'spec_helper'

describe ActivityStreams::Address do

  before do
    @addy = ActivityStreams::Address.new
  end

  it "should create an address" do
    @addy.should_not be_nil
  end

  it "Should require a formatted address" do
    @addy.should_not be_valid
    @addy.formatted = "25 Sierra St, San Francisco, CA 94107"
    @addy.should be_valid
  end
end