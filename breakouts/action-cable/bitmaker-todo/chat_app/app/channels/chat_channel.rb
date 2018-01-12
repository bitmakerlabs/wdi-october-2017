class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "the-only-channel"
  end

  def receive(data)
    ActionCable.server.broadcast("the-only-channel", data)
  end

end
