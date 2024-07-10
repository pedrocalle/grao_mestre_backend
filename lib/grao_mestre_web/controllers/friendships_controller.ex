defmodule GraoMestreWeb.FriendshipsController do
  alias GraoMestreWeb.FallbackController
  alias GraoMestre.Friendships
  alias GraoMestre.Friendships.Friendship
  use GraoMestreWeb, :controller

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Friendship{} = friendship} <- Friendships.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, friendship: friendship)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Friendship{} = friendship} <- Friendships.get(id) do
      conn
      |> put_status(:ok)
      |> render(:show, friendship: friendship)
    end
  end

  def update(conn, params) do
    with {:ok, %Friendship{} = friendship} <- Friendships.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, friendship: friendship)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Friendship{} = friendship} <- Friendships.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, friendship: friendship)
    end
  end
end
