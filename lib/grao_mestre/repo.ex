defmodule GraoMestre.Repo do
  use Ecto.Repo,
    otp_app: :grao_mestre,
    adapter: Ecto.Adapters.Postgres
end
