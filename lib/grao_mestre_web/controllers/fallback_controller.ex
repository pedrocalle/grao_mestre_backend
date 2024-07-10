defmodule GraoMestreWeb.FallbackController do
  alias Ecto.Changeset
  alias GraoMestreWeb.FallbackController
  use GraoMestreWeb, :controller

  action_fallback FallbackController

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: GraoMestreWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: GraoMestreWeb.ErrorJSON)
    |> render(:error, status: :bad_request)
  end

  def call(conn, {:error, %{error: error}}) do
    conn
    |> put_status(:forbidden)
    |> put_view(json: GraoMestreWeb.ErrorJSON)
    |> render(:error, %{error: error})
  end

  def call(conn, {:error, %Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: GraoMestreWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
