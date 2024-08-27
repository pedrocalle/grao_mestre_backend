defmodule GraoMestreWeb.CoffeesJSON do
  alias GraoMestre.Coffees.Coffee

  def create(%{coffee: coffee}) do
    %{
      message: "Café criado com sucesso",
      data: data(coffee)
    }
  end

  def get(%{coffee: coffee}), do: data(coffee)

  def search(%{coffees: coffees}), do: Enum.map(coffees, &data(&1))

  def update(%{coffee: coffee}) do
    %{
      message: "Café atualizado com sucesso",
      data: data(coffee)
    }
  end

  def delete(%{coffee: coffee}), do: %{data: data(coffee)}

  def data(%Coffee{} = coffee) do
    %{
      id: coffee.id,
      name: coffee.name,
      average_score: coffee.average_score,
      picture: coffee.picture
    }
  end
end
