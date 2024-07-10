defmodule GraoMestre.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GraoMestreWeb.Telemetry,
      GraoMestre.Repo,
      {DNSCluster, query: Application.get_env(:grao_mestre, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GraoMestre.PubSub},
      # Start a worker by calling: GraoMestre.Worker.start_link(arg)
      # {GraoMestre.Worker, arg},
      # Start to serve requests, typically the last entry
      GraoMestreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GraoMestre.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraoMestreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
