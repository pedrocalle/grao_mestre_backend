defmodule GraoMestre.Votes.Delete do
  alias GraoMestre.Repo
  alias GraoMestre.Votes.Vote

  def call(id) do
    case Repo.get(Vote, id) do
      nil -> {:error, :not_found}
      vote -> Repo.delete(vote)
    end
  end
end
