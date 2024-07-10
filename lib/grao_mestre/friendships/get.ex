defmodule GraoMestre.Friendships.Get do
  alias GraoMestre.Friendships.Friendship
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(Friendship, id) do
      nil -> {:error, :not_found}
      friendship -> {:ok, friendship}
    end
  end
end
