module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#person
  class Person < ActivityStreams::Object

    validates_presence_of :display_name

      # For compatibility
      def avatar_url
        image ? image.url : ActivityStreams.person_default_url
      end

      # For compatibility
      def avatar_thumb_url
        avatar_url
      end
  end
end
