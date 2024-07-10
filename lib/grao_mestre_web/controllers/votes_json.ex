defmodule GraoMestreWeb.VotesJSON do
  alias GraoMestre.Votes.Vote

  def create(%{vote: vote}) do
    %{
      message: "Voto criado com sucesso",
      data: data(vote)
    }
  end

  def show(%{vote: vote}), do: data(vote)

  def update(%{vote: vote}) do
    %{
      message: "Vote atualizado com sucesso",
      data: data(vote)
    }
  end

  def delete(%{vote: vote}) do
    %{
      message: "Vote deletado com sucesso",
      data: data(vote)
    }
  end

  def data(%Vote{} = vote) do
    %{
      id: vote.id,
      user_id: vote.user_id,
      recipe_id: vote.recipe_id,
      is_upvote: vote.is_upvote
    }
  end
end
