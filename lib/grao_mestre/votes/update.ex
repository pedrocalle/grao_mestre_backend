defmodule GraoMestre.Votes.Update do
  alias GraoMestre.Votes.Vote
  alias GraoMestre.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Vote, id) do
      nil -> {:error, :not_found}
      vote -> update(vote, params)
    end
  end

  defp update(vote, params) do
    vote
    |> Vote.changeset(params)
    |> Repo.update()
  end
end
