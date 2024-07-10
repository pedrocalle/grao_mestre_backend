defmodule GraoMestre.Votes do
  alias GraoMestre.Votes.Delete
  alias GraoMestre.Votes.Update
  alias GraoMestre.Votes.Get
  alias GraoMestre.Votes.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
