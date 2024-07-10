defmodule GraoMestre.Recipes.Delete do
  alias GraoMestre.Recipes.Recipe
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(Recipe, id) do
      nil -> {:error, :not_found}
      recipe -> Repo.delete(recipe)
    end
  end
end
