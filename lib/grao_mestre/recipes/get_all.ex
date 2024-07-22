defmodule GraoMestre.Recipes.GetAll do
  import Ecto.Query
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call() do
    recipe_query = from r in Recipe, preload: [:user, :coffee]
    case Repo.all(recipe_query) do
      nil -> {:error, %{error: "Lista está vazia"}}
      list -> {:ok, list}
    end
  end
end
