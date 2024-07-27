defmodule ReactiveRiverWeb.Editor.EditorController do
  use ReactiveRiverWeb, :controller

  def editor(conn, _params) do
    render(conn, :editor)
  end
end
