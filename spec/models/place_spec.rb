require 'spec_helper'

describe ActivityStreams::Place do

  before do
    @place = ActivityStreams::Place.new
  end

  it "should create a place" do
    @place.should_not be_nil
    @place.class.superclass.should == ActivityStreams::Object
  end

  it "Should require a valid address" do
    @place.should_not be_valid
    @place.address = ActivityStreams::Address.new
    @place.should_not be_valid

    @place.address.formatted = "25 Sierra St, San Francisco, CA 94107"
    @place.should be_valid
  end
end