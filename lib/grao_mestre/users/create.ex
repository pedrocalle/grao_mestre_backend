defmodule GraoMestre.Users.Create do
  alias GraoMestre.Repo
  alias GraoMestre.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
