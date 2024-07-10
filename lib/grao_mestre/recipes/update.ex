defmodule GraoMestre.Recipes.Update do
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call(%{"id" => id} = params) do
    case Repo.get(Recipe, id) do
      nil -> {:error, :not_found}
      recipe -> update(recipe, params)
    end
  end

  defp update(recipe, params) do
    recipe
    |> Recipe.changeset(params)
    |> Repo.update()
  end
end
