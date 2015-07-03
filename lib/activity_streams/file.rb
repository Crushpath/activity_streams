module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#file
  class File < ActivityStreams::Object

    field :mime_type, type:String
  end
end