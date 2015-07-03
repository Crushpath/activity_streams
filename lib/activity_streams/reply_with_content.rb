module ActivityStreams
  class ReplyWithContent < ReplyAction
    field :content, :type => String

    validates_presence_of :content
  end
end

