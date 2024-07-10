defmodule GraoMestreWeb.VotesController do
  alias GraoMestreWeb.FallbackController
  alias GraoMestre.Votes
  alias GraoMestre.Votes.Vote
  use GraoMestreWeb, :controller

  action_fallback FallbackController

  def create(conn, params) do
    %{user_id: user_id} = conn.assigns[:user_id]
    params = Map.put(params, "user_id", user_id)

    with {:ok, %Vote{} = vote} <- Votes.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, vote: vote)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Vote{} = vote} <- Votes.get(id) do
      conn
      |> put_status(:ok)
      |> render(:show, vote: vote)
    end
  end

  def update(conn, params) do
    with {:ok, %Vote{} = vote} <- Votes.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, vote: vote)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Vote{} = vote} <- Votes.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, vote: vote)
    end
  end
end
