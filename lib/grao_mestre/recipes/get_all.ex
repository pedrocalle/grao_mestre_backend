defmodule GraoMestre.Recipes.GetAll do
  alias GraoMestre.Repo
  alias GraoMestre.Recipes.Recipe

  def call() do
    case Repo.all(Recipe) do
      nil -> {:error, %{error: "Lista está vazia"}}
      list -> {:ok, Enum.map(list, fn data -> Repo.preload(data, [:user, :coffee]) end)}
    end
  end
end
