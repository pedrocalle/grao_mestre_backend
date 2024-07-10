defmodule GraoMestre.Votes.Get do
  alias GraoMestre.Votes.Vote
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(Vote, id) do
      nil -> {:error, :not_found}
      vote -> {:ok, vote}
    end
  end
end
