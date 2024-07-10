defmodule GraoMestre.Friendships.Create do
  alias GraoMestre.Friendships.Friendship
  alias GraoMestre.Repo

  def call(params) do
    params
    |> Friendship.changeset()
    |> Repo.insert()
  end
end
