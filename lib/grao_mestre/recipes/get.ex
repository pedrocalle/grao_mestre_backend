defmodule GraoMestre.Recipes.Get do
  import Ecto.Query
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call(id) do
    recipe_query = from r in Recipe, preload: [:user, :coffee]
    case Repo.get(recipe_query, id) do
      nil -> {:error, :not_found}
      recipe -> {:ok, recipe}
    end
  end
end
