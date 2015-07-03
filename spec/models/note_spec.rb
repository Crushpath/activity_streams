require 'spec_helper'

describe ActivityStreams::Note do
  it "should require content" do
    note = ActivityStreams::Note.new
    note.should_not be_valid
    note.content = "Product X is amazing"
    note.should be_valid
  end

  it "should set the proper object type" do
    note = ActivityStreams::Note.new
    note.object_type.should == :note
  end
end