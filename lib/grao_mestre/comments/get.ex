defmodule GraoMestre.Comments.Get do
  alias GraoMestre.Repo
  alias GraoMestre.Comments.Comment

  def call(id) do
    case Repo.get(Comment, id) do
      nil -> {:error, :not_found}
      comment -> {:ok, comment}
    end
  end
end
