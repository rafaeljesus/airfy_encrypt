defmodule AirfyEncrypt.Model.Encrypt do
  def create(key, data) do
    with {:ok, priv} <- RsaEx.generate_private_key,
      {:ok, pub} <- RsaEx.generate_public_key(priv),
      {:ok, cipher_text} <- RsaEx.encrypt(key, pub),
      do: {:ok, cipher_text}
  end
end
