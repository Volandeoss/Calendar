defmodule CalendarFrontWeb.Calendar do
  use CalendarFrontWeb, :surface_live_view


  def mount(_params, _session, socket) do
  {:ok, socket}
  end

  def render(assigns) do
    ~F"""

      <container class="bg-gray-200 flex-wrap-around">


      </container>
    """
  end
end
