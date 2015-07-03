require 'spec_helper'

describe ActivityStreams::Badge do

  before do
    @badge = ActivityStreams::Badge.new
  end

  it "should create a badge" do
    @badge.should_not be_nil
    @badge.class.superclass.should == ActivityStreams::Object
  end

  it "Should require a name" do
    @badge.should_not be_valid
    @badge.display_name = "Rockstar"
    @badge.should be_valid
  end
end