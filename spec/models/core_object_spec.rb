require 'spec_helper'

describe ActivityStreams::Object do

  it "Should be instantiable" do
    ao = ActivityStreams::Object.new
    ao.should_not be_nil
  end

  it "should set the proper object type" do
    ao = ActivityStreams::Object.new
    ao.object_type.should == :object
  end
end
