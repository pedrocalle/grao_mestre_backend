defmodule GraoMestre.Coffees.Create do
  alias GraoMestre.Repo
  alias GraoMestre.Coffees.Coffee

  def call(params) do
    params
    |> Coffee.changeset()
    |> Repo.insert()
  end
end
