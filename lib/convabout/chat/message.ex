defmodule Convabout.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field(:body, :string)
    belongs_to(:post, Chat.Post)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
