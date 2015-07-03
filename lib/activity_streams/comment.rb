module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#comment
  class Comment < ActivityStreams::Object
    validates_presence_of :content
  end
end