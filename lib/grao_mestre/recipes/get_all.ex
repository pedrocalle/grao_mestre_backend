defmodule GraoMestre.Recipes.GetAll do
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call() do
    case Repo.all(Recipe) do
      nil -> {:error, %{error: "Lista está vazia"}}
      list -> {:ok, list}
    end
  end
end
