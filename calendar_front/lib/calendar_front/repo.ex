defmodule CalendarFront.Repo do
  use Ecto.Repo,
    otp_app: :calendar_front,
    adapter: Ecto.Adapters.Postgres
end
