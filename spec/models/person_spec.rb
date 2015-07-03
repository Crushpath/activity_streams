require 'spec_helper'

describe ActivityStreams::Person do

  before do
    @person = ActivityStreams::Person.new
    @image_url = 'http://c683771.r71.cf2.rackcdn.com/uploads/product/avatar/person_thumb_default.png'
    ActivityStreams.configure do |config|
      config.person_default_url = @image_url
    end
  end

  it "should have default thumbnail" do
    @person.avatar_url.should_not be_nil
    expect(@person.avatar_url).to eq(@image_url)
  end

  it "should return non-default thumbnail if specified" do
    @person.image = ActivityStreams::MediaItem.new(:url => 'some_url.jpg', :media_type => :image)
    @person.avatar_url.should_not be_nil
    @person.avatar_url.should_not =~ /default.png$/
    @person.avatar_url.should =~ /some_url.jpg$/
  end
end