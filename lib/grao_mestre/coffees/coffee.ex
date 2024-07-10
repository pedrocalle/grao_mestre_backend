defmodule GraoMestre.Coffees.Coffee do
  use Ecto.Schema
  import Ecto.Changeset

  @parameters_create [:name, :average_score, :picture]

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "coffees" do
    field :name, :string
    field :average_score, :float
    field :picture, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @parameters_create)
    |> validate_required([:name])
  end

  def changeset(coffee, params) do
    coffee
    |> cast(params, @parameters_create)
    |> validate_required([:name])
  end
end
