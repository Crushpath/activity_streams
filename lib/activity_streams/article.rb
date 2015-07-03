module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#article
  class Article < ActivityStreams::Object
    validates_presence_of :content
  end
end