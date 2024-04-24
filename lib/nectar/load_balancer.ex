defmodule Nectar.LoadBalancer do
  @files_per_proces 50

  def spawn_processes(_folder_path) do
    IO.puts("Not implemented yed")
  end
  def count_needed_processes(files) do
    div(files, @files_per_proces)
  end
end
