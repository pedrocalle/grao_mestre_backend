defmodule GraoMestre.Comments.Delete do
  alias GraoMestre.Comments.Comment
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(Comment, id) do
      nil -> {:error, :not_found}
      comment -> Repo.delete(comment)
    end
  end
end
