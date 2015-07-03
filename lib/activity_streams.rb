require "activity_streams/version"
require "nameable"
require 'mongoid'


require "activity_streams/action"
require "activity_streams/activity"
require "activity_streams/object"
require "activity_streams/address"
require "activity_streams/article"
require "activity_streams/audio"
require "activity_streams/badge"
require "activity_streams/bookmark"
require "activity_streams/collection"
require "activity_streams/comment"
require "activity_streams/event"
require "activity_streams/file"
require "activity_streams/group"
require "activity_streams/image"
require "activity_streams/media_item"
require "activity_streams/note"
require "activity_streams/person"
require "activity_streams/place"
require "activity_streams/product"
require "activity_streams/question"
require "activity_streams/reply_action"
require "activity_streams/reply_with_content"
require "activity_streams/review"
require "activity_streams/service"
require "activity_streams/version"
require "activity_streams/video"


module ActivityStreams
  @verbs = {:post => {}}
  @object_types = {}
  @activity_types = []


  class << self
    attr_accessor :verbs, :object_types, :activity_types, :distance_of_time_in_words

    def configure(&block)
      yield self
    end


  end
end
