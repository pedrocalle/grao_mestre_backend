defmodule GraoMestre.Coffees.Search do
  alias GraoMestre.Repo
  alias GraoMestre.Coffees.Coffee
  import Ecto.Query, only: [from: 2]

  def call(query) do
    query
    |>String.trim()
    |>search_query()
    |>Repo.all()
  end


  defp search_query(search) do
    from c in Coffee, where: ilike(c.name, ^"%#{search}%")
  end
end
