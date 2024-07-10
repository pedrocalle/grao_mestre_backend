defmodule GraoMestre.Recipes do
  alias GraoMestre.Recipes.GetAll
  alias GraoMestre.Recipes.Delete
  alias GraoMestre.Recipes.Update
  alias GraoMestre.Recipes.Get
  alias GraoMestre.Recipes.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate get_all(), to: GetAll, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
