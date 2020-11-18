defmodule ConvaboutWeb.RegistrationController do
  use ConvaboutWeb, :controller

  alias Convabout.Repo

  alias Convabout.Accounts.User

  def sign_up(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("success.json", user: user)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Convabout.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
