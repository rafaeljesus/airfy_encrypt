defmodule AirfyEncrypt.Router.Encrypt do
  use Maru.Router

  alias AirfyEncrypt.Model.Encrypt

  version "v1"

  namespace :encrypt do
    params do
      requires :text, type: String
    end

    post do
      {:ok, pub_key} = Encrypt.create(params[:text], conn.user)
      json(conn, %{pub_key: pub_key})
    end
  end
end
