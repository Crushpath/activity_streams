module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#place
  class Place < ActivityStreams::Object

    field :position, type:String # The optional latitude, longitude and altitude of the place as a point on Earth.
                                 # Represented as an ISO 6709 compliant string.
                                 # For instance "position":"+27.5916+086.5640+8850/".

    embeds_one :address, :class_name => "ActivityStreams::Address"

    validates_presence_of :address
    validates_associated :address

  end
end