module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#audio
  class Audio < ActivityStreams::Object

    field :embed_code, :type => String

    embeds_one :stream, :class_name => "ActivityStreams::MediaItem", :as => "MediaObject"

    validates_presence_of :stream
    validates_associated :stream
  end
end