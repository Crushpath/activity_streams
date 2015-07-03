module ActivityStreams

  # http://activitystrea.ms/head/activity-schema.html#event
  class Event < ActivityStreams::Object

    field :end_time, :type => DateTime
    field :start_time, :type => DateTime

    embeds_many :attending, :class_name => "ActivityStreams::Person"
    embeds_many :maybe_attending, :class_name => "ActivityStreams::Person"
    embeds_many :not_attending, :class_name => "ActivityStreams::Person"

    embeds_one :location, :class_name => "ActivityStreams::Place"

    validates_presence_of :start_time
    validates_presence_of :display_name
    validates_presence_of :location
  end
end