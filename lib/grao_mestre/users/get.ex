defmodule GraoMestre.Users.Get do
  alias GraoMestre.Repo
  alias GraoMestre.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
