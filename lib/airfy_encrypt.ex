defmodule AirfyEncrypt do
  use Application

  def start(_type, _args) do
    AirfyEncrypt.Supervisor.start_link
  end
end
