module ActivityStreams

  class Address
    include Mongoid::Document

    embedded_in :place

    field :formatted, type: String
    field :streetAddress, type: String
    field :locality, type: String
    field :region, type: String
    field :postalCode, type: String
    field :country, type: String

    validates_presence_of :formatted

    before_validation :formatted_from_parts, :unless => :formatted


    def formatted_from_parts
      parts = [streetAddress, locality, "#{region} #{postalCode}", country]
      self.formatted ||= parts.compact.join(", ")
    end
  end
end