require 'spec_helper'

describe ActivityStreams::Activity do

  before (:all) do

  end

  before do
    @act = ActivityStreams::Activity.new
    @act.verb = :create
    @act.actor = ActivityStreams::Person.new(display_name: "Monica Wilkinson")
  end

  it "should save" do
    @act.should be_valid
    @act.save
    @act.id.should_not be_nil
    expect(@act.created_at).to_not be_nil
  end

  describe 'since_words' do
    context "with a simple method" do
      before do
        ActivityStreams.configure do |config|
          config.distance_of_time_in_words = Proc.new do |from, to|
            "#{from} - #{to}"
          end
        end
      end

      it "should use the configured method" do
        @act.save
        expect(@act.since_words).to include("#{@act.created_at}")
      end
    end

    context "with a simple method" do
      before do
        ActivityStreams.configure do |config|
          config.distance_of_time_in_words = Proc.new do |from, to|
            'just now'
          end
        end
      end

      it "should use the configured method" do
        @act.save
        expect(@act.since_words).to eq("just now")
      end
    end
  end



end

