defmodule Iceland do
  def run({[selector: selector], files, _}) do
    files
    |> Stream.flat_map(fn file ->
      {:ok, document} = File.read(file)
      {:ok, html} = Floki.parse_document(document)

      Floki.find(html, selector)
      |> Enum.map(fn result ->
        {file, Floki.raw_html(result)}
      end)
    end)
    |> Enum.group_by(fn {file, _result} -> file end, fn {_file, result} -> result end)
    |> Enum.each(fn {file, results} ->
      IO.puts(IO.ANSI.bright() <> IO.ANSI.green() <> file <> ":" <> IO.ANSI.reset())

      Enum.each(results, fn result ->
        IO.puts(String.trim(result))
      end)
    end)
  end
end
