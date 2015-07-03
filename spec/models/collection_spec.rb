require 'spec_helper'

describe ActivityStreams::Collection do

  before do
    @list = ActivityStreams::Collection.new
    @obj1
  end

  it "should create a bookmark" do
    @list.should_not be_nil
    @list.class.superclass.should == ActivityStreams::Object
  end

  it "should return number of children" do
    @list.object_types << "photo"
    @list.object_types << 'video'


    @list.object_types.should == ['photo', 'video']
  end
end