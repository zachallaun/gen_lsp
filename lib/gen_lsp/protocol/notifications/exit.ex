# codegen: do not edit
defmodule GenLSP.Notifications.Exit do
  @moduledoc """
  The exit event is sent from the client to the server to
  ask the server to exit its process.

  Message Direction: clientToServer
  """

  import Schematic, warn: false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field :method, String.t(), default: "exit"
    field :jsonrpc, String.t(), default: "2.0"
    field :params, nil
  end

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      method: str("exit"),
      jsonrpc: str("2.0"),
      params: null()
    })
  end
end
