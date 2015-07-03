module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#image
  class Image < ActivityStreams::Object

    embeds_one :full_image, :class_name => "ActivityStreams::MediaItem", :as => "MediaObject"
  end
end