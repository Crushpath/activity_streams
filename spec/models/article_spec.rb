require 'spec_helper'

describe ActivityStreams::Article do

  before do
    @news_article = ActivityStreams::Article.new
  end

  it "should create an article" do
    @news_article.should_not be_nil
    @news_article.class.superclass.should == ActivityStreams::Object
  end

  it "Should require content" do
    @news_article.should_not be_valid
    @news_article.content = "This is the story of A & B"
    @news_article.should be_valid
  end
end