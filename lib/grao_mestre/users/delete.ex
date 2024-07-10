defmodule GraoMestre.Users.Delete do
  alias GraoMestre.Users.User
  alias GraoMestre.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
