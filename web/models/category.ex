defmodule Rumbl.Category do
  use Rumbl.Web, :model

  schema "categories" do
    field :name, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def alphabetical(query) do
    from c in query, order_by: c.name
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> assoc_constraint(:category)
  end

  def names_and_ids(query) do
    from c in query, select: {c.name, c.id}
  end
end
