defmodule Iceland.CLI do
  def main(args) do
    args
    |> OptionParser.parse_head(aliases: [s: :selector], strict: [selector: :string])
    |> Iceland.run()
  end
end
