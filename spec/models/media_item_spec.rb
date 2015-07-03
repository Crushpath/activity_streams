require 'spec_helper'

describe ActivityStreams::MediaItem do
  it "should be able to be instantiated" do
    media_item = ActivityStreams::MediaItem.new(:url => 'some_url.jpg', :media_type => :image)
    media_item.should be_valid
  end

  it "should be not be valid with missing media_type" do
    media_item = ActivityStreams::MediaItem.new(:url => 'some_url.jpg')
    media_item.should_not be_valid
  end

  it "should be not be valid with missing url" do
    media_item = ActivityStreams::MediaItem.new(:media_type => :image)
    media_item.should_not be_valid
  end

  it "should be not be valid with wrong media_type" do
    media_item = ActivityStreams::MediaItem.new(:media_type => :cool_new_type)
    media_item.should_not be_valid
  end

  it "should be able to be instantiated as valid image" do
    media_item = ActivityStreams::MediaItem.new(:url => 'some_url.jpg', :media_type => :image)
    media_item.should be_valid
  end

  it "should be able to be instantiated as valid video" do
    media_item = ActivityStreams::MediaItem.new(:url => 'some_url.mp4', :media_type => :video)
    media_item.should be_valid
  end

  it "should be able to be instantiated as valid audio" do
    media_item = ActivityStreams::MediaItem.new(:url => 'some_url.mp3', :media_type => :audio)
    media_item.should be_valid
  end

end
