module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#note
  class Note < ActivityStreams::Object
    validates_presence_of :content
  end
end