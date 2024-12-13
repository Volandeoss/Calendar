defmodule CalendarFront.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CalendarFrontWeb.Telemetry,
      CalendarFront.Repo,
      {DNSCluster, query: Application.get_env(:calendar_front, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CalendarFront.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CalendarFront.Finch},
      # Start a worker by calling: CalendarFront.Worker.start_link(arg)
      # {CalendarFront.Worker, arg},
      # Start to serve requests, typically the last entry
      CalendarFrontWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CalendarFront.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CalendarFrontWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
