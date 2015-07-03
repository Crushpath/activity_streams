require "spec_helper"

describe ActivityStreams::Video do

  before do
    @video = ActivityStreams::Video.new
  end

  it "should create a video" do
    @video.should_not be_nil
    @video.class.superclass.should == ActivityStreams::Object
  end
end