module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#collection
  class Collection < ActivityStreams::Object
    field :object_types, type: Array, default: []
  end
end