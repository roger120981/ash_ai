defmodule AshAi.Mcp.Dev do
  @moduledoc "Place in your endpoint's code_reloading section to expose Ash dev MCP at /mcp/ash"
  @behaviour Plug

  @impl true
  def init(opts) do
    AshAi.Mcp.Router.init(Keyword.put(opts, :tools, :ash_dev_tools))
  end

  @impl true
  def call(%Plug.Conn{path_info: ["mcp", "ash" | rest]} = conn, opts) do
    conn
    |> Plug.forward(rest, AshAi.Mcp.Router, opts)
    |> Plug.Conn.halt()
  end

  def call(conn, _opts), do: conn
end
