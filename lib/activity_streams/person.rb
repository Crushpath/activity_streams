module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#person
  class Person < ActivityStreams::Object
    DEFAULT_AVATAR = 'http://c683771.r71.cf2.rackcdn.com/uploads/product/avatar/person_thumb_default.png'

    validates_presence_of :display_name

      # For compatibility
      def avatar_url
        image ? image.url : DEFAULT_AVATAR
      end

      # For compatibility
      def avatar_thumb_url
        avatar_url
      end
  end
end
