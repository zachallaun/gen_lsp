# codegen: do not edit
defmodule GenLSP.Requests.TextDocumentRename do
  @moduledoc """
  A request to rename a symbol.

  Message Direction: clientToServer
  """

  import Schematic, warn: false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field :method, String.t(), default: "textDocument/rename"
    field :jsonrpc, String.t(), default: "2.0"
    field :id, integer(), enforce: true
    field :params, GenLSP.Structures.RenameParams.t()
  end

  @type result :: GenLSP.Structures.WorkspaceEdit.t() | nil

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      method: str("textDocument/rename"),
      jsonrpc: str("2.0"),
      id: int(),
      params: GenLSP.Structures.RenameParams.schematic()
    })
  end

  @doc false
  @spec result() :: Schematic.t()
  def result() do
    oneof([GenLSP.Structures.WorkspaceEdit.schematic(), null()])
  end
end
