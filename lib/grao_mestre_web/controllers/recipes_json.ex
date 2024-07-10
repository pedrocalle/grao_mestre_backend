defmodule GraoMestreWeb.RecipesJSON do
  alias GraoMestre.Recipes.Recipe

  def create(%{recipe: recipe}) do
    %{
      message: "Receita criada com sucesso!",
      data: data(recipe)
    }
  end

  def show(%{recipe: recipe}), do: data(recipe)

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
end
