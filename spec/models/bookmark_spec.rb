require 'spec_helper'

describe ActivityStreams::Bookmark do

  before do
    @pin = ActivityStreams::Bookmark.new
  end

  it "should create a bookmark" do
    @pin.should_not be_nil
    @pin.class.superclass.should == ActivityStreams::Object
  end

  it "Should require a target_url" do
    @pin.should_not be_valid
    @pin.target_url = "http://google.com/ABC"
    @pin.should be_valid
  end
end