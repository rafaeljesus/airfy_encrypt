defmodule AirfyEncrypt.API do
  use Maru.Router

  plug CORSPlug
  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  plug AirfyEncrypt.Middleware.JwtAuth

  mount AirfyEncrypt.Router.Health
  mount AirfyEncrypt.Router.Token
  mount AirfyEncrypt.Router.Encrypt

  rescue_from :all, as: e do
    IO.inspect(e)
    conn
    |> put_status(500)
    |> text("Server Error")
  end
end
