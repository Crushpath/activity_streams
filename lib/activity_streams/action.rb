module ActivityStreams
  class Action
    include ActionView::Helpers::DateHelper if defined?(ActionView)

    VERBS = [:post, :view, :comment, :"request-contact", :reject, :thank, :confirm, :change, :remove,
             :send, :create, :add, :"make-friend", :system, :label, :locate, :publish, :unpublish, :receive,
             :complete, :dismiss, :evolve, :message, :open, :email_reply, :call, :read, :sign_in, :sign_out,
             :like, :promote]

    include Mongoid::Document
    include Mongoid::Timestamps


    def safe_distance_of_time_in_words(to, from)
      ActivityStreams::distance_of_time_in_words.call(to, from) if from && ActivityStreams::distance_of_time_in_words
    end

    def since_words(to=Time.now.utc)
      safe_distance_of_time_in_words(to, created_at)
    end

    def since_update_words(to=Time.now.utc)
      safe_distance_of_time_in_words(to, updated_at)
    end
    # Natural-language title or headline for the activity encoded as a single JSON String containing HTML markup.
    # An activity MAY contain a title property.
    field :title, :type => String

    # Identifies the action that the activity describes. An activity SHOULD contain a verb property whose
    # value is a JSON String that is non-empty and matches either the "isegment-nz-nc" or the "IRI" production
    # in [RFC3339]. Note that the use of a relative reference other than a simple name is not allowed.
    # If the verb is not specified, or if the value is null, the verb is assumed to be "post".
    field :verb, :type => Symbol, :default => :post

    # Describes the primary object of the activity. For instance, in the activity,
    # "John saved a movie to his wishlist", the object of the activity is "movie".
    # An activity SHOULD contain an object property whose value is a single Object.
    # If the object property is not contained, the primary object of the activity MAY be implied by context.
    embeds_one :object, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"

    # Describes the entity that performed the activity.
    # An activity MUST contain one actor property whose value is a single Object.
    embeds_one :actor, :class_name => "ActivityStreams::Object", :as => "ObjectContainer"


    validates_inclusion_of :verb, in: VERBS
    validates_presence_of :actor
    validates_associated :actor, :object

    delegate :attachments, :to => :object, :allow_nil => true
    delegate :downstream_duplicates, :to => :object, :allow_nil => true
    delegate :upstream_duplicates, :to => :object, :allow_nil => true

  end
end

