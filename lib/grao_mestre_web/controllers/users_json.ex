defmodule GraoMestreWeb.UsersJSON do
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: data(user)

  def login(%{token: token}) do
    %{
      message: "User autenticado com sucesso",
      bearer: token
    }
  end

  def update(%{user: user}) do
    %{
      message: "User atualizado com sucesso!",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}

  def data(user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      country: user.country
    }
  end
end
