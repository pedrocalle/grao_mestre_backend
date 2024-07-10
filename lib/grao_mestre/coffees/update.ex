defmodule GraoMestre.Coffees.Update do
  alias GraoMestre.Repo
  alias GraoMestre.Coffees.Coffee

  def call(%{"id" => id} = params) do
    case Repo.get(Coffee, id) do
      nil ->
        {:error, :not_found}

      coffee ->
        update(coffee, params)
    end
  end

  defp update(coffee, params) do
    coffee
    |> Coffee.changeset(params)
    |> Repo.update()
  end
end
