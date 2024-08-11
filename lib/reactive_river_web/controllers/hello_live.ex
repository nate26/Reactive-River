defmodule ReactiveRiverWeb.HelloLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "Hello, LiveView!")}
  end

  def handle_event("test", _params, socket) do
    IO.puts("Test event triggered")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1><%= @message %></h1>
       <button phx-click="test">Click Me</button>
    </div>
    """
  end
end
