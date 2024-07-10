defmodule GraoMestre.Recipes.Recipe do
  alias GraoMestre.Users.User
  alias GraoMestre.Coffees.Coffee
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  @required_parameters [
    :user_id,
    :coffee_id,
    :roast_date,
    :roast_type,
    :coffee_type,
    :grind,
    :water_weight,
    :coffe_weight,
    :temperature,
    :preparation_method,
    :description,
    :image,
    :score
  ]

  schema "recipes" do
    belongs_to :user, User
    belongs_to :coffee, Coffee
    field :roast_date, :date
    field :roast_type, :integer
    field :coffee_type, :string
    field :grind, :string
    field :water_weight, :integer
    field :coffe_weight, :integer
    field :temperature, :integer
    field :preparation_method, :string
    field :description, :string
    field :image, :string
    field :score, :float

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_parameters)
    |> validate_required(@required_parameters)
    |> validate_inclusion(:score, [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0],
      message: "Valores invalidos"
    )
  end

  def changeset(recipe, params) do
    recipe
    |> cast(params, @required_parameters)
    |> validate_required(@required_parameters)
    |> validate_inclusion(:score, [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0],
      message: "Valores invalidos"
    )
  end
end
