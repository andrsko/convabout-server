defmodule Convabout.Repo.Migrations.MakeUsernameCaseInsensitive do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :username, :citext
    end
  end
end
