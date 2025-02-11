# codegen: do not edit
defmodule GenLSP.Requests.WindowShowDocument do
  @moduledoc """
  A request to show a document. This request might open an
  external program depending on the value of the URI to open.
  For example a request to open `https://code.visualstudio.com/`
  will very likely open the URI in a WEB browser.

  @since 3.16.0

  Message Direction: serverToClient
  """

  import Schematic, warn: false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field :method, String.t(), default: "window/showDocument"
    field :jsonrpc, String.t(), default: "2.0"
    field :id, integer(), enforce: true
    field :params, GenLSP.Structures.ShowDocumentParams.t()
  end

  @type result :: GenLSP.Structures.ShowDocumentResult.t()

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      method: str("window/showDocument"),
      jsonrpc: str("2.0"),
      id: int(),
      params: GenLSP.Structures.ShowDocumentParams.schematic()
    })
  end

  @doc false
  @spec result() :: Schematic.t()
  def result() do
    GenLSP.Structures.ShowDocumentResult.schematic()
  end
end
