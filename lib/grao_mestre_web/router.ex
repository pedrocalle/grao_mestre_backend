defmodule GraoMestreWeb.Router do
  use GraoMestreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug GraoMestreWeb.Plugs.Auth
  end

  scope "/api", GraoMestreWeb do
    pipe_through :api

    resources "/users", UsersController, only: [:create]
    post "/users/login", UsersController, :login
  end

  scope "/api", GraoMestreWeb do
    pipe_through [:api, :auth]

    resources "/users", UsersController, only: [:show, :update, :delete]
    resources "/coffees", CoffeesController, only: [:create, :show, :update, :delete]
    resources "/recipes", RecipesController, only: [:create, :show, :update, :delete]
    get "/recipes", RecipesController, :show_all
    get "/me", UsersController, :get_me
    get "/users/search/:query", UsersController, :search
    get "/coffees/search/:query", CoffeesController, :search
    resources "/votes", VotesController, only: [:create, :show, :update, :delete]
    resources "/friendships", FriendshipsController, only: [:create, :show, :update, :delete]
    resources "/comments", CommentsController, only: [:create, :show, :update, :delete]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:grao_mestre, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: GraoMestreWeb.Telemetry
    end
  end
end
