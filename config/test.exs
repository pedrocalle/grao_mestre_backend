import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :grao_mestre, GraoMestre.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "grao_mestre_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :grao_mestre, GraoMestreWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ttR/02EOlzpr9L8OmxzogEpQHfa+tFr6GyogXkn0i9Zh0Kxl3lXq1X01YZP2dEKJ",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
