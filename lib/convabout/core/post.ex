defmodule Convabout.Core.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:title, :string)
    has_many(:messages, Convabout.Core.Message)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
