module ActivityStreams
  class Object
      include Mongoid::Document
      include Nameable

      embedded_in :object_container, :polymorphic => true

      # An IRI [RFC3987] identifying a resource providing an HTML representation of the object.
      # An object MAY contain a url property
      field :url, :type => String

      # This is actually the definition of the field above
      # And the field above is being used as id
      # TODO: Fix when we split the stream
      field :public_url

      # A natural-language, human-readable and plain-text name for the object. HTML markup MUST NOT be included. An object
      # MAY contain a displayName property. If the object does not specify an objectType property, the object
      # SHOULD specify a displayName.
      field :display_name, :type => String

      # Natural-language summarization of the object encoded as a single JSON String containing HTML markup.
      # Visual elements such as thumbnail images MAY be included. An activity MAY contain a summary property.
      field :summary, :type => String

      # Natural-language description of the object encoded as a single JSON String containing HTML markup.
      # Visual elements such as thumbnail images MAY be included. An object MAY contain a content property.
      field :content, :type => String

      # A JSON Array of one or more absolute IRI's [RFC3987] identifying objects that duplicate this object's content.
      # An object SHOULD contain a downstreamDuplicates property when there are known objects, possibly in a different system,
      # that duplicate the content in this object.
      # This MAY be used as a hint for consumers to use when resolving duplicates between objects received from different sources.
      field :downstream_duplicates, :type => Array

      # A JSON Array of one or more absolute IRI's [RFC3987] identifying objects that duplicate this object's content.
      # An object SHOULD contain an upstreamDuplicates property when a publisher is knowingly duplicating with a new ID the
      # content from another object.
      # This MAY be used as a hint for consumers to use when resolving duplicates between objects received from different sources.
      field :upstream_duplicates, :type => Array

      # Description of a resource providing a visual representation of the object, intended for human consumption.
      # An object MAY contain an image property whose value is a Media Link.
      embeds_one :image, :class_name => "ActivityStreams::MediaItem", :as => "MediaObject"

      # For compatibility
      delegate :avatar, :to => :image

      def external_url
        if upstream_duplicates
          return upstream_duplicates.first
        end
      end

      # For compatibility
      def avatar_url
        image.url if image
      end

      # For compatibility
      def avatar_thumb_url
        image.url if image
      end

      # see if this is an index in the same sub collection
      embeds_one :author, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

      # A collection of one or more additional, associated objects, similar to the concept of attached files in an email message.
      # An object MAY have an attachments property whose value is a JSON Array of Objects.
      embeds_many :attachments, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"



      # Identifies the type of object. An object MAY contain an objectType property whose value is a
      # JSON String that is non-empty and matches either the "isegment-nz-nc" or the "IRI" production
      # in [RFC3987]. Note that the use of a relative reference other than a simple name is not allowed.
      # If no objectType property is contained, the object has no specific type.
      def object_type
        self.class.to_s.gsub("ActivityStreams::", "").downcase.to_sym
      end

      def type_display_name
        parts = self.class.to_s.split(/\:\:/)
        parts.last.titleize
      end

      def get_relational_id
        if self.url
          rtype, rid = self.url.split('/')
          rid.to_i if rid
        end
      end
    end
end
