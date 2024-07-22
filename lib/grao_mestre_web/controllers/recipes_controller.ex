defmodule GraoMestreWeb.RecipesController do
  alias GraoMestre.Recipes
  alias GraoMestre.Recipes.Recipe
  alias GraoMestreWeb.FallbackController
  use GraoMestreWeb, :controller

  action_fallback FallbackController

  def create(conn, params) do
    %{user_id: user_id} = conn.assigns[:user_id]
    params = Map.put(params, "user_id", user_id)

    with {:ok, %Recipe{} = recipe} <- Recipes.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{recipe: recipe})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Recipe{} = recipe} <- Recipes.get(id) do
      conn
      |> put_status(:ok)
      |> render(:show, %{recipe: recipe})
    end
  end

  def show_all(conn, _) do
    with {:ok, list} <- Recipes.get_all() do
      conn
      |> put_status(:ok)
      |> json(list)
    end
  end

  def update(conn, params) do
    with {:ok, %Recipe{} = recipe} <- Recipes.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{recipe: recipe})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Recipe{} = recipe} <- Recipes.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, recipe: recipe)
    end
  end
end
