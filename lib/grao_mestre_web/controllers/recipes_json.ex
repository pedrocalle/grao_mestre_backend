defmodule GraoMestreWeb.RecipesJSON do
  alias GraoMestre.Users.User
  alias GraoMestre.Coffees.Coffee
  alias GraoMestre.Recipes.Recipe

  def create(%{recipe: recipe}) do
    %{
      message: "Receita criada com sucesso!",
      data: data(recipe)
    }
  end

  def show(%{recipe: recipe}), do: data(recipe)

  def show_all(%{recipes: recipes}) do
    %{
      data: Enum.map(recipes, &data_get(&1))
    }
  end

  def update(%{recipe: recipe}) do
    %{
      message: "Receita atualizada com sucesso!",
      data: data(recipe)
    }
  end

  def delete(%{recipe: recipe}) do
    %{
      message: "Receita deletada com sucesso!",
      data: data(recipe)
    }
  end

  def data_get(%Recipe{} = recipe) do
    %{
      id: recipe.id,
      user_id: recipe.user_id,
      user: user(recipe.user),
      coffee_id: recipe.coffee_id,
      coffee: coffee(recipe.coffee),
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
  def data(%Recipe{} = recipe) do
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

  def user(%User{} = user) do
    %{
      name: user.name,
      email: user.email,
      country: user.country
    }
  end

  def coffee(%Coffee{} = coffee) do
    %{
      name: coffee.name,
      average_score: coffee.average_score,
      picture: coffee.picture
    }
  end
end
