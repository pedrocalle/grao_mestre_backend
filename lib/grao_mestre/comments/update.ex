defmodule GraoMestre.Comments.Update do
  alias GraoMestre.Comments.Comment
  alias GraoMestre.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Comment, id) do
      nil -> {:error, :not_found}
      comment -> update(comment, params)
    end
  end

  defp update(comment, params) do
    comment
    |> Comment.changeset(params)
    |> Repo.update()
  end
end
