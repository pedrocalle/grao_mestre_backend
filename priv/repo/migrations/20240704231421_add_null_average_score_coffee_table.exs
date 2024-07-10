defmodule GraoMestre.Repo.Migrations.AddNullAverageScoreCoffeeTable do
  use Ecto.Migration

  def change do
    drop table("votes")
    drop table("recipes")
    drop table("coffees")

    create table("coffees", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :average_score, :float, null: true
      add :picture, :string, null: true

      timestamps()
    end

    create table("recipes", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :coffee_id, references(:coffees, type: :uuid)
      add :roast_date, :date, null: true
      add :roast_type, :integer
      add :coffee_type, :string
      add :grind, :string
      add :water_weight, :integer
      add :coffe_weight, :integer
      add :temperature, :integer
      add :preparation_method, :string
      add :description, :string
      add :image, :string
      add :score, :float

      timestamps()
    end

    create table("votes", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :recipe_id, references(:recipes, type: :uuid)
      add :is_upvote, :boolean
    end
  end
end
