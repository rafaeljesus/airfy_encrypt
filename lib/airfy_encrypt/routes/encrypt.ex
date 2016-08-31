defmodule AirfyEncrypt.Router.Encrypt do
  use Maru.Router

  alias AirfyEncrypt.Model.Encrypt

  version "v1"

  namespace :encrypt do
    params do
      requires :data, type: Map
    end

    post do
      key = params[:user][:email]
      data = params[:data]
      {:ok, pub_key} = Encrypt.create(key, data)
      json(conn, %{pub_key: pub_key})
    end
  end
end
