defmodule GraoMestre.Friendships.Friendship do
  alias GraoMestre.Users.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "friendships" do
    belongs_to :sender, User
    belongs_to :receiver, User
    field :status, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:sender_id, :receiver_id, :status])
    |> validate_required([:sender_id, :receiver_id, :status])
    |> validate_inclusion(:status, ["pending", "accepted", "denied"], message: "Status Invalido")
  end

  def changeset(friendship, params) do
    friendship
    |> cast(params, [:sender_id, :receiver_id, :status])
    |> validate_required([:sender_id, :receiver_id, :status])
    |> validate_inclusion(:status, ["pending", "accepted", "denied"], message: "Status Invalido")
  end
end
