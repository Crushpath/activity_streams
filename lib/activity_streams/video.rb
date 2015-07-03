module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#video
  class Video < ActivityStreams::Object

    field :embed_code, type: String

    embeds_one :stream, class_name: "ActivityStreams::MediaItem", :as => "MediaObject"

    validates_associated :stream
  end
end