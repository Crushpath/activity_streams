# ActivityStreams

Mongoid models which can be used to write activity streams to a Mongo DB

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activity_streams'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activity_streams

## Usage

``` ruby

Mongoid.configure do |config|
  config.sessions = {:default => {:hosts => ["localhost:27017"], :database => "activity_streams"}}
end


ActivityStreams.configure do |config|
  config.distance_of_time_in_words = Proc.new do |from, to|
    Module::distance_of_time_in_words(from, to) 
  end
  config.verbs[:view] = {}
  config.verbs[:comment] = {}
  
  config.activity_types = [:opportunity, :organization, :comment, :buyer_message, :buyer_question, :buyer_organization, :milestone, :article, :buyer_article]
end


act = ActivityStreams::Activity.new
act.verb = :view
act.actor = ActivityStreams::Person.new(display_name: "Monica Wilkinson")
act.object = ActivityStreams::Article.new(content: "This is the story of A & B")
act.save!

2.2.2 :019 > act.reload.object
 => #<ActivityStreams::Article _id: 5596e4be0e4dc9544c000003, url: nil, public_url: nil, display_name: nil, summary: nil, content: "This is the story of A & B", downstream_duplicates: nil, upstream_duplicates: nil, _type: "ActivityStreams::Article"> 

```

#### Mongo Document is

``` json
{ "_id" : ObjectId( "5596e4be0e4dc9544c000001" ),
  "verb" : "view",
  "_type" : "ActivityStreams::Activity",
  "updated_at" : Date( 1435952319581 ),
  "created_at" : Date( 1435952319581 ),
  "object" : { "_id" : ObjectId( "5596e4be0e4dc9544c000003" ),
    "_type" : "ActivityStreams::Article",
    "content" : "This is the story of A & B" },
  "actor" : { "_id" : ObjectId( "5596e4be0e4dc9544c000002" ),
    "_type" : "ActivityStreams::Person",
    "display_name" : "Monica Wilkinson" } }
```    

