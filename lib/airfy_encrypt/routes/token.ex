defmodule AirfyEncrypt.Router.Token do
  use Maru.Router

  import Joken

  version "v1"

  namespace :token do
    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      token = %{email: params[:email]}
      |> token
      |> with_signer(hs256("airfy_encrypt_secret"))
      |> sign
      |> get_compact
      json(conn, %{token: token})
    end
  end
end
