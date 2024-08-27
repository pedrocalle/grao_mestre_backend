defmodule GraoMestre.Coffees do
  alias GraoMestre.Coffees.Search
  alias GraoMestre.Coffees.Delete
  alias GraoMestre.Coffees.Update
  alias GraoMestre.Coffees.Create
  alias GraoMestre.Coffees.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate search(query), to: Search, as: :call
end
