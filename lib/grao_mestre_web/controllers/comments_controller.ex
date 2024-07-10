defmodule GraoMestreWeb.CommentsController do
  alias GraoMestreWeb.FallbackController
  alias GraoMestre.Comments
  alias GraoMestre.Comments.Comment
  use GraoMestreWeb, :controller

  action_fallback FallbackController

  def create(conn, params) do
    %{user_id: user_id} = conn.assigns[:user_id]
    params = Map.put(params, "user_id", user_id)

    with {:ok, %Comment{} = comment} <- Comments.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{comment: comment})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Comment{} = comment} <- Comments.get(id) do
      conn
      |> put_status(:ok)
      |> render(:show, %{comment: comment})
    end
  end

  def update(conn, params) do
    with {:ok, %Comment{} = comment} <- Comments.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{comment: comment})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Comment{} = comment} <- Comments.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{comment: comment})
    end
  end
end
