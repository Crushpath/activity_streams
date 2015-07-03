module ActivityStreams

  class MediaItem
    include Mongoid::Document

    store_in collection: "media_items"

    MEDIA_TYPES = [:image, :audio, :video]

    field :duration, :type => Integer
    field :height, :type => Integer
    field :width, :type => Integer

    field :url, :type => String
    field :media_type, :type => Symbol

    validates_presence_of :url
    validates_inclusion_of :media_type, in: MEDIA_TYPES

    embedded_in :media_object, :polymorphic => true
  end
end

