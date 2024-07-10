defmodule GraoMestre.Votes.Create do
  alias GraoMestre.Repo
  alias GraoMestre.Votes.Vote

  def call(params) do
    with :ok <- check_vote(params) do
      params
      |> Vote.changeset()
      |> Repo.insert()
    end
  end

  defp check_vote(%{"user_id" => user_id, "recipe_id" => recipe_id}) do
    case Repo.get_by(Vote, user_id: user_id, recipe_id: recipe_id) do
      nil -> :ok
      _vote -> {:error, %{error: "Você já votou nessa receita"}}
    end
  end
end
