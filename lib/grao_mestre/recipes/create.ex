defmodule GraoMestre.Recipes.Create do
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call(params) do
    params
    |> Recipe.changeset()
    |> Repo.insert()
  end
end
