defmodule GraoMestre.Comments do
  alias GraoMestre.Comments.Delete
  alias GraoMestre.Comments.Update
  alias GraoMestre.Comments.Get
  alias GraoMestre.Comments.Create
  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
