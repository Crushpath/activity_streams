require 'spec_helper'

describe ActivityStreams::Person do

  before do
    @person = ActivityStreams::Person.new
  end

  it "should have default thumbnail" do
    @person.avatar_url.should_not be_nil
    @person.avatar_url.should =~ /default.png$/
    @person.avatar_url.should =~ /person/
  end

  it "should return non-default thumbnail if specified" do
    @person.image = ActivityStreams::MediaItem.new(:url => 'some_url.jpg', :media_type => :image)
    @person.avatar_url.should_not be_nil
    @person.avatar_url.should_not =~ /default.png$/
    @person.avatar_url.should =~ /some_url.jpg$/
  end
end