defmodule GraoMestre.Comments.Create do
  alias GraoMestre.Repo
  alias GraoMestre.Comments.Comment

  def call(params) do
    params
    |> Comment.changeset()
    |> Repo.insert()
  end
end
