defmodule GraoMestre.Comments.Comment do
  alias GraoMestre.Recipes.Recipe
  alias GraoMestre.Users.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "comments" do
    belongs_to :user, User
    belongs_to :recipe, Recipe
    field :content, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:content, :user_id, :recipe_id])
    |> validate_required([:content, :user_id, :recipe_id])
  end

  def changeset(comment, params) do
    comment
    |> cast(params, [:content, :user_id, :recipe_id])
    |> validate_required([:content, :user_id, :recipe_id])
  end
end
