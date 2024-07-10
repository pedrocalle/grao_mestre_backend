defmodule GraoMestre.Recipes.Get do
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call(id) do
    case Repo.get(Recipe, id) do
      nil -> {:error, :not_found}
      recipe -> {:ok, recipe}
    end
  end
end
