defmodule Todo do
 def create_todos do

  # using pipe
  {no_of_tasks, _b} = IO.gets("Enter the no. of todos you want to add: ") |> Integer.parse()

    for _i <- 1..no_of_tasks do
      IO.gets("Enter a task: ") |> String.trim()
    end
 end

 # creating a todo list
 def todo_list do
  ["go running", "read book", "learn phoenix", "work on project"]
 end

 # removing the completed task
 def finish_task(todos, task) do
   if contains?(todos, task) do
     List.delete(todos, task)
   else
    :task_not_found
   end
 end

 # add new todo
  def add_task(todos, task) do
    List.insert_at(todos, -1, task)
  end

 # checking if a task is present in out todo list
  def contains?(todos, task) do
    Enum.member?(todos, task)
 end

 # search for a keyword in todo list
 def keyword_search(todos, word) do
  for task <- todos, String.contains?(task, word) do
    task
  end
 end

 # get some random task from the todo list
 def random_task(todos, num) do
   Enum.take_random(todos,num)
 end

 #
 # write to file
 def save(todos, filename) do
    # converting the list into binary format so that it can be written to the file
    binary = :erlang.term_to_binary(todos)
    File.write(filename, binary)
 end

 # read from file
 def read(filename) do
  case File.read(filename) do
    {:ok, binary} -> :erlang.binary_to_term(binary)
    {:error, _reason} -> "File does not exist"
  end
 end
end
