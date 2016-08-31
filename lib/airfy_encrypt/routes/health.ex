defmodule AirfyEncrypt.Router.Health do
  use Maru.Router

  version "v1"

  namespace :health do
    get do
      json(conn, %{alive: true})
    end
  end
end
