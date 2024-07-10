defmodule GraoMestre.Users.Verify do
  alias GraoMestre.Users.User
  alias GraoMestre.Repo

  def call(%{"email" => email, "password" => password}) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, %{error: "Email e/ou senha incorretos"}}
      user -> verify(user, password)
    end
  end

  defp verify(user, password) do
    case Argon2.verify_pass(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, %{error: "Email e/ou senha incorretos"}}
    end
  end
end
