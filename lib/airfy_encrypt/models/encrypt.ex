defmodule AirfyEncrypt.Model.Encrypt do

  def create(text, user) do
    with {:ok, priv} <- RsaEx.generate_private_key,
      {:ok, pub} <- RsaEx.generate_public_key(priv),
      :ok <- File.write(user["email"], pub),
      {:ok, cipher_text} <- RsaEx.encrypt(text, pub),
      do: {:ok, cipher_text}
  end
end
