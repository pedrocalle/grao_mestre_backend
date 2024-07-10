defmodule GraoMestre.Repo.Migrations.AddCoffeeTable do
  use Ecto.Migration

  def change do
    create table("coffees", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :average_score, :float
      add :picture, :string, null: true

      timestamps()
    end
  end
end
