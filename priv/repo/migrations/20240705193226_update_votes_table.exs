defmodule GraoMestre.Repo.Migrations.UpdateVotesTable do
  use Ecto.Migration

  def change do
    drop table("votes")

    create table("votes", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, type: :uuid)
      add :recipe_id, references(:recipes, type: :uuid)
      add :is_upvote, :boolean
    end
  end
end
