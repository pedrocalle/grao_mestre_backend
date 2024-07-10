defmodule GraoMestreWeb.FriendshipsJSON do
  alias GraoMestre.Friendships.Friendship

  def create(%{friendship: friendship}) do
    %{
      message: "Amizade criada com sucesso",
      data: data(friendship)
    }
  end

  def show(%{friendship: friendship}), do: data(friendship)

  def update(%{friendship: friendship}) do
    %{
      message: "Amizade atualizada com sucesso",
      data: data(friendship)
    }
  end

  def delete(%{friendship: friendship}) do
    %{
      message: "Amizade deletado com sucesso",
      data: data(friendship)
    }
  end

  defp data(%Friendship{} = friendship) do
    %{
      id: friendship.id,
      sender_id: friendship.sender_id,
      receiver_id: friendship.receiver_id,
      status: friendship.status
    }
  end
end
