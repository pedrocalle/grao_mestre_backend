defmodule GraoMestreWeb.CoffeesController do
  alias GraoMestre.Coffees
  alias GraoMestre.Coffees.Coffee
  use GraoMestreWeb, :controller

  action_fallback GraoMestreWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Coffee{} = coffee} <- Coffees.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, coffee: coffee)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Coffee{} = coffee} <- Coffees.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, coffee: coffee)
    end
  end

  def update(conn, params) do
    with {:ok, %Coffee{} = coffee} <- Coffees.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, coffee: coffee)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Coffee{} = coffee} <- Coffees.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, coffee: coffee)
    end
  end
end
