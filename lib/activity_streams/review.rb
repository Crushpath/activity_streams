module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#review
  class Review < ActivityStreams::Object

    field :rating, :type => Integer
    field :options, :type => Array

  end
end