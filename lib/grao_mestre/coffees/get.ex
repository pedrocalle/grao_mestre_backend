defmodule GraoMestre.Coffees.Get do
  alias GraoMestre.Repo
  alias GraoMestre.Coffees.Coffee

  def call(id) do
    case Repo.get(Coffee, id) do
      nil -> {:error, :not_found}
      coffee -> {:ok, coffee}
    end
  end
end
