module ActivityStreams

  class Activity < Action

    validates_associated :target_in, :generator, :provider

    store_in collection: "activities"

    # An IRI [RFC3987] identifying a resource providing an HTML representation of the activity.
    # An activity MAY contain a url property.
    field :url, :type => String

    # Natural-language description of the activity encoded as a single JSON String containing HTML markup.
    # Visual elements such as thumbnail images MAY be included. An activity MAY contain a content property.
    field :content, :type => String

    # Description of a resource providing a visual representation of the object, intended for human consumption.
    # The image SHOULD have an aspect ratio of one (horizontal) to one (vertical) and SHOULD be suitable for presentation
    # at a small size. An activity MAY have an icon property.
    embeds_one :icon, :class_name => "ActivityStreams::MediaItem", :as => "MediaObject"

    # Describes the target of the activity. The precise meaning of the activity's target is dependent on the activities
    # verb, but will often be the object the English preposition "to". For instance, in the activity,
    # "John saved a movie to his wishlist", the target of the activity is "wishlist".
    # The activity target MUST NOT be used to identity an indirect object that is not a target of the activity.
    # An activity MAY contain a target property whose value is a single Object.
    embeds_one :target_in, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

    # Describes the application that generated the activity. An activity MAY contain a generator property
    # whose value is a single Object.
    embeds_one :generator, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

    # Describes the application that published the activity. Note that this is not necessarily the same entity that
    # generated the activity. An activity MAY contain a provider property whose value is a single Object.
    embeds_one :provider, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

    # Source of the original content for the activity
    embeds_one :source, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

  end


end

