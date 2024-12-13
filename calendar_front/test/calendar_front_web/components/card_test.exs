defmodule CalendarFrontWeb.Components.CardTest do
  use CalendarFrontWeb.ConnCase, async: true
  use Surface.LiveViewTest

  catalogue_test CalendarFrontWeb.Components.Card
end
