require 'spec_helper'

describe ActivityStreams::Audio do

  before do
    @meeting_recording = ActivityStreams::Audio.new
  end

  it "should create an audio recording" do
    @meeting_recording.should_not be_nil
    @meeting_recording.class.superclass.should == ActivityStreams::Object
  end

  it "Should require an audio stream" do
    @meeting_recording.should_not be_valid

    @stream = ActivityStreams::MediaItem.new
    @stream.url = "http://myvoice.com/1"
    @stream.media_type = :audio
    @stream.should be_valid

    @meeting_recording.stream = @stream
    @meeting_recording.should be_valid
  end
end