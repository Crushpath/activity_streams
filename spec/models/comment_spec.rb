require 'spec_helper'

describe ActivityStreams::Comment do

  before do
    @comment = ActivityStreams::Comment.new
  end

  it "should create an audio recording" do
    @comment.should_not be_nil
    @comment.class.superclass.should == ActivityStreams::Object
  end

  it "Should require content" do
    @comment.should_not be_valid
    @comment.content = "This is so great !"
    @comment.should be_valid
  end

  #it "should be saveable inside an Activity" do
  #  @comment.content = "This is so great !"
  #  @storyline = Storyline::Storyline.new
  #
  #  @story = Storyline::Story.new
  #
  #  @act = Storyline::Activity.new :object => @comment
  #
  #end
end