defmodule GraoMestre.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params_create [:name, :email, :password]
  @required_params_update [:name, :email]

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :country, :string
    field :tools, :string
    field :about_me, :string
    field :profile_picture, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> validate_required(@required_params_create)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params_update)
    |> validate_required(@required_params_update)
    |> validate_format(:email, ~r/@/)
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    salt = Pbkdf2.Base.gen_salt()
    change(changeset, password_hash: Pbkdf2.Base.hash_password(password, salt))
  end

  defp add_password_hash(changeset), do: changeset
end
