defmodule GraoMestre.Friendships.Delete do
  alias GraoMestre.Friendships.Friendship
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(Friendship, id) do
      nil -> {:error, :not_found}
      friendship -> Repo.delete(friendship)
    end
  end
end
