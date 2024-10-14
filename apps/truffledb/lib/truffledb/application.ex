defmodule Truffledb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Truffledb.Repo,
      {DNSCluster, query: Application.get_env(:truffledb, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Truffledb.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Truffledb.Finch}
      # Start a worker by calling: Truffledb.Worker.start_link(arg)
      # {Truffledb.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Truffledb.Supervisor)
  end
end
