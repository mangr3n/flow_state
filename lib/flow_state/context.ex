defmodule FlowState.Context do
  @moduledoc """
  Manages the execution context for AI flows, including state, configuration, and environment.
  """
  use TypedStruct

  typedstruct do
    field :id, String.t(), enforce: true
    field :state, map(), default: %{}
    field :config, map(), default: %{}
    field :tools, list(FlowState.Tool.t()), default: []
    field :history, list(map()), default: []
    field :metadata, map(), default: %{}
  end

  def new(id, opts \\ []) do
    %__MODULE__{
      id: id,
      state: Keyword.get(opts, :state, %{}),
      config: Keyword.get(opts, :config, %{}),
      tools: Keyword.get(opts, :tools, []),
      history: [],
      metadata: Keyword.get(opts, :metadata, %{})
    }
  end

  def add_tool(%__MODULE__{} = context, tool) do
    %{context | tools: [tool | context.tools]}
  end

  def add_history(%__MODULE__{} = context, entry) do
    %{context | history: [entry | context.history]}
  end

  def update_state(%__MODULE__{} = context, key, value) do
    %{context | state: Map.put(context.state, key, value)}
  end
end
