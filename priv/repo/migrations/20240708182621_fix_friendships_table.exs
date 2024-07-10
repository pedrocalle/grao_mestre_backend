defmodule GraoMestre.Repo.Migrations.FixFriendshipsTable do
  use Ecto.Migration

  def change do
    drop table("friendships")

    create table("friendships", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :sender_id, references(:users, type: :uuid)
      add :receiver_id, references(:users, type: :uuid)
      add :status, :string

      timestamps()
    end
  end
end
