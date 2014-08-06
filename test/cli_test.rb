Dir["./lib/*.rb"].each { |file| require file }

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'

class CLITest < Minitest::Spec
  def test_it_displays_program_instructions
    printer = MessagePrinter.new
    assert_output("Enter 'p' to play, 'i' for instructions, or 'q' to quit.\n") { printer.program_instructions }
  end

  def call(input)
    input_stream  = StringIO.new(input)
    result        = CLI.new(input_stream).get_input
  end

  def test_it_processes_the_input_that_was_passed_in
    result = call("4")
    assert_equal "4", result
  end
end
