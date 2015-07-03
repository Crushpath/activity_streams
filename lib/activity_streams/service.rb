module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#service
  class Service < ActivityStreams::Object
    validates_presence_of :display_name
  end

  class Website < Service
    validates_presence_of :url
  end
end