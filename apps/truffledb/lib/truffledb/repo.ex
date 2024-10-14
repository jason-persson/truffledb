defmodule Truffledb.Repo do
  use Ecto.Repo,
    otp_app: :truffledb,
    adapter: Ecto.Adapters.Postgres
end
