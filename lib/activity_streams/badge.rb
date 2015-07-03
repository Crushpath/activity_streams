module ActivityStreams
  # http://activitystrea.ms/head/activity-schema.html#badge
  class Badge < ActivityStreams::Object
    validates_presence_of :display_name
  end
end