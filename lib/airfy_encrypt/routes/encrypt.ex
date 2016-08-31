defmodule AirfyEncrypt.Router.Encrypt do
  use Maru.Router

  version "v1"

  namespace :encrypt do
    params do
      requires :key, type: Map
    end

    post do
      # get user
      # call fs and write create pub key on disk
      json(conn, %{created: true})
    end
  end
end
