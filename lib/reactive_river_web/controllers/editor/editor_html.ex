defmodule ReactiveRiverWeb.Editor.EditorHTML do
  use ReactiveRiverWeb, :html

  def handle_event("code-editor-lost-focus", %{"value" => value}, socket) do
    IO.puts(value)
    {:noreply, assign(socket, :source, value)}
  end

  def get_level_code do
    File.read!("priv/static/levels/chp1/level_1.js")
  end

  def get_opts do
    Map.merge(
        LiveMonacoEditor.default_opts(),
        %{"language" => "javascript"}
    )
  end

  def on_change do
    IO.puts("on_change")
  end

  embed_templates "editor_html/*"
end
