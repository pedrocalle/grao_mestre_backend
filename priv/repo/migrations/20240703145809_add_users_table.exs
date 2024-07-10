defmodule GraoMestre.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password_hash, :string
      add :email, :string
      add :country, :string
      add :tools, :string, null: true
      add :about_me, :string, null: true
      add :profile_picture, :string, null: true

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
