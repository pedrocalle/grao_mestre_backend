defmodule GraoMestre.Users do
  alias GraoMestre.Users.Search
  alias GraoMestre.Users.Delete
  alias GraoMestre.Users.Update
  alias GraoMestre.Users.Get
  alias GraoMestre.Users.Create
  alias GraoMestre.Users.Verify

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate login(params), to: Verify, as: :call
  defdelegate search(query), to: Search, as: :call
end
