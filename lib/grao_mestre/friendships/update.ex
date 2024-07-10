defmodule GraoMestre.Friendships.Update do
  alias GraoMestre.Friendships.Friendship
  alias GraoMestre.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Friendship, id) do
      nil -> {:error, :not_found}
      friendship -> update(friendship, params)
    end
  end

  defp update(friendship, params) do
    friendship
    |> Friendship.changeset(params)
    |> Repo.update()
  end
end
