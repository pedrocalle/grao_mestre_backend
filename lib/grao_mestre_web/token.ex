defmodule GraoMestreWeb.Token do
  alias GraoMestreWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "grao_mestre_api"

  def sign(user) do
    Token.sign(Endpoint, @sign_salt, %{user_id: user.id})
  end

  def verify(token) do
    Token.verify(Endpoint, @sign_salt, token)
  end
end
