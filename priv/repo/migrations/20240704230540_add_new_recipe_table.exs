defmodule GraoMestre.Repo.Migrations.AddNewRecipeTable do
  use Ecto.Migration

  def change do
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
  end
end
