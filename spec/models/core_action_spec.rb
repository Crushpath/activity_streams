require 'spec_helper'

describe ActivityStreams::Action do

  it "Should be instantiable" do
    act = ActivityStreams::Action.new
    act.should_not be_nil
  end

  it "requires a verb" do
    note = ActivityStreams::Note.new(:content => "Bla")
    person = ActivityStreams::Person.new(:display_name => "Matt Wilkinson")

    act = ActivityStreams::Action.new :object => note, :actor => person
    act.verb = nil
    act.should_not be_valid
    act.verb = :post
    act.should be_valid
  end

  it "requires an actor" do
    note = ActivityStreams::Note.new(:content => "Bla")
    person = ActivityStreams::Person.new(:display_name => "Matt Wilkinson")

    act = ActivityStreams::Action.new :object => note
    act.should_not be_valid
    act.actor = person
    act.should be_valid
  end
end
