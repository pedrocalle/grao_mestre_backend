defmodule GraoMestreWeb.UsersController do
  use GraoMestreWeb, :controller

  alias GraoMestreWeb.Token
  alias GraoMestre.Users.User
  alias GraoMestre.Users

  action_fallback GraoMestreWeb.FallbackController

  def create(conn, params) do
    params = Map.put(params, "country", "Brasil")
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end

  def search(conn, %{"query" => query}) do
    with users <- Users.search(query) do
      conn
      |> put_status(:ok)
      |> render(:search, %{users: users})
    end
  end

  def get_me(conn, _) do
    %{user_id: user_id} = conn.assigns[:user_id]
    with {:ok, %User{} = user} <- Users.get(user_id) do
      conn
      |> put_status(:ok)
      |> render(:get, %{user: user})
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  def delete(conn, id) do
    with {:ok, %User{} = user} <- Users.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, user: user)
    end
  end

  def login(conn, params) do
    with {:ok, %User{} = user} <- Users.login(params) do
      token = Token.sign(user)

      conn
      |> put_status(:ok)
      |> render(:login, token: token)
    end
  end
end
