defmodule GraoMestreWeb.UsersJSON do
  alias GraoMestre.Recipes.Recipe
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: data_get(user)

  def login(%{token: token}) do
    %{
      message: "User autenticado com sucesso",
      bearer: token
    }
  end

  def update(%{user: user}) do
    %{
      message: "User atualizado com sucesso!",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}

  def search(%{users: users}), do: Enum.map(users, &data(&1))

  def data(user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      country: user.country
    }
  end
  def data_get(user) do
    %{
      id: user.id,
      name: user.name,
      recipes: Enum.map(user.recipes, &recipe(&1)),
      email: user.email,
      country: user.country
    }
  end

  def recipe(%Recipe{} = recipe) do
    %{
      id: recipe.id,
      user_id: recipe.user_id,
      coffee_id: recipe.coffee_id,
      coffee_weight: recipe.coffe_weight,
      coffee_type: recipe.coffee_type,
      grind: recipe.grind,
      water_weight: recipe.water_weight,
      temperature: recipe.temperature,
      preparation_method: recipe.preparation_method,
      description: recipe.description,
      image: recipe.image,
      score: recipe.score
    }
  end
end
