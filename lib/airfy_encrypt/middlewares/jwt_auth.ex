defmodule AirfyEncrypt.Middleware.JwtAuth do
  use Maru.Middleware

  import Joken

  def call(conn, _opts) do
    case conn.request_path do
      "/v1/health" -> conn
      "/v1/token" -> conn
      "/v1/encrypt" -> decode_token(conn)
    end
  end

  defp decode_token(conn) do
    conn = fetch_query_params(conn)
    struct = conn.params["access_token"]
    |> token
    |> with_signer(hs256("airfy_encrypt_secret"))
    |> verify
    Map.put(conn, :user, struct.claims)
  end
end
