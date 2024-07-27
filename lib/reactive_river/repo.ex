defmodule ReactiveRiver.Repo do
  use Ecto.Repo,
    otp_app: :reactive_river,
    adapter: Ecto.Adapters.Postgres
end
