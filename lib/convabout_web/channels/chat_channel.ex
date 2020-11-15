defmodule ConvaboutWeb.ChatChannel do
  use ConvaboutWeb, :channel

  alias Convabout.Core

  @impl true
  def join("chat:" <> _room, _payload, socket) do
    # if authorized?(payload) do
    {:ok, socket}
    # else
    #  {:error, %{reason: "unauthorized"}}
    # end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # @impl true
  # def handle_in("ping", payload, socket) do
  #  {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    "chat:" <> post_id = socket.topic
    # post = Core.get_post!(post_id)
    payload = Map.merge(payload, %{"post_id" => post_id})
    Core.create_message(payload)
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
