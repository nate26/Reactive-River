defmodule ReactiveRiverWeb.Editor.EditorLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, chapter: 1, level: 1, disable_test: true)}
  end

  def handle_event("test-code", _params, socket) do
    if Map.has_key?(socket.assigns, :code) do
      answer = File.read!("priv/static/levels/testing/level_1/answer_1_1.txt")
      result = ReactiveRiver.ProcessJs.validate_code(socket.assigns.code, {answer, 0})

      case result do
        {:ok, results} ->
          IO.puts("success")
          {:noreply, assign(socket, test_success: true, test_results: results)}

        {:error, err} ->
          IO.puts("error")
          {:noreply, assign(socket, test_success: false, test_results: err)}
      end
    else
      IO.puts("no key")
      {:noreply, socket}
    end
  end

  def handle_event("code_change", %{"value" => value}, socket) do
    {:noreply, assign(socket, :code, value)}
  end

  def get_level_code do
    IO.puts("get_level_code")
    # IO.puts(params)
    File.read!("priv/static/levels/testing/level_1/prompt_1_1.js")
  end

  def get_opts do
    Map.merge(
      LiveMonacoEditor.default_opts(),
      %{"language" => "javascript"}
    )
  end

  embed_templates "editor_live/*"
end
