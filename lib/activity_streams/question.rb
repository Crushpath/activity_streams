module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#question
  class Question < ActivityStreams::Object

    field :options, :type => Array
  end
end