defmodule GraoMestre.Votes.Vote do
  alias GraoMestre.Recipes.Recipe
  alias GraoMestre.Users.User
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:is_upvote, :user_id, :recipe_id]

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "votes" do
    belongs_to :user, User
    belongs_to :recipe, Recipe
    field :is_upvote, :boolean
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

  def changeset(vote, params) do
    vote
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
