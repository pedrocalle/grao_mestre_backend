defmodule GraoMestreWeb.CommentsJSON do
  alias GraoMestre.Comments.Comment

  def create(%{comment: comment}) do
    %{
      message: "Comentario criado com sucesso!",
      data: data(comment)
    }
  end

  def show(%{comment: comment}), do: data(comment)

  def update(%{comment: comment}) do
    %{
      message: "Comentario atualizado com sucesso!",
      data: data(comment)
    }
  end

  def delete(%{comment: comment}) do
    %{
      message: "Comentario deletado com sucesso!",
      data: data(comment)
    }
  end

  def data(%Comment{} = comment) do
    %{
      id: comment.id,
      user_id: comment.user_id,
      recipe_id: comment.recipe_id,
      content: comment.content
    }
  end
end
