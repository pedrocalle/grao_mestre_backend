defmodule GraoMestre.Users.Search do
  import Ecto.Query, only: [from: 2]
  alias GraoMestre.Repo
  alias GraoMestre.Users.User
  def call(query) do
    query
    |>String.trim()
    |>search_query()
    |>Repo.all()
  end

  defp search_query(search) do
    from u in User, where: ilike(u.name, ^"%#{search}%")
  end
end
