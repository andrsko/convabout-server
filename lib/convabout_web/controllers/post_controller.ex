defmodule ConvaboutWeb.PostController do
  use ConvaboutWeb, :controller

  alias Convabout.Chat
  alias Convabout.Chat.Post

  action_fallback ConvaboutWeb.FallbackController

  def index(conn, _params) do
    posts = Chat.list_posts()
    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Chat.create_post(post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Chat.get_post!(id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Chat.get_post!(id)

    with {:ok, %Post{} = post} <- Chat.update_post(post, post_params) do
      render(conn, "show.json", post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Chat.get_post!(id)

    with {:ok, %Post{}} <- Chat.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end
end
