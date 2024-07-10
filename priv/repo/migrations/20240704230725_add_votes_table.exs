defmodule GraoMestre.Repo.Migrations.VotesTable do
  use Ecto.Migration

  def change do
    create table("votes", primary_key: false) do
      add :id, :uuid, primarey_key: true
      add :user_id, references(:users, type: :uuid)
      add :recipe_id, references(:recipes, type: :uuid)
      add :is_upvote, :boolean
    end
  end
end
