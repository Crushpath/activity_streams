module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#group
  class Group < ActivityStreams::Object
    validates_presence_of :display_name
  end
end