defmodule GraoMestre.Friendships do
  alias GraoMestre.Friendships.Delete
  alias GraoMestre.Friendships.Update
  alias GraoMestre.Friendships.Get
  alias GraoMestre.Friendships.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
