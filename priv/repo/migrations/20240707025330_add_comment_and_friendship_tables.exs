defmodule GraoMestre.Repo.Migrations.AddCommentAndFriendshipTables do
  use Ecto.Migration

  def change do
    create table("comments", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :recipe_id, references(:recipes, type: :uuid)
      add :content, :string

      timestamps()
    end

    create table("friendships", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :recipe_id, references(:recipes, type: :uuid)
      add :content, :string

      timestamps()
    end
  end
end
