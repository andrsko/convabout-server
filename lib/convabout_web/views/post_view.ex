defmodule ConvaboutWeb.PostView do
  use ConvaboutWeb, :view
  alias ConvaboutWeb.PostView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      inserted_at: post.inserted_at,
      updated_at: post.updated_at,
      username: post.user.username
    }
  end
end
