module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#bookmark
  class Bookmark < ActivityStreams::Object

    field :target_url, :type => String

    validates_presence_of :target_url
  end
end