require_relative 'message_printer'
require_relative 'game'

class CLI
  attr_reader :command, :printer, :output_stream, :input_stream

  def initialize(input_stream)
    @command = ""
    @printer = MessagePrinter.new
    @input_stream  = input_stream
  end

  def start
    print_welcome_message
    until finished?
      printer.command_request
      @command = get_input
      process_initial_commands
    end
    printer.ending
  end

  def get_input
    input_stream.gets.chomp
  end

  def print_instructions
    printer.intro
  end

  private

  def process_initial_commands
    case
    when play?
      game = Game.new(printer)
      game.play
    when instructions?
      printer.game_instructions
    else
      printer.not_a_valid_command
    end
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end

  def finished?
    command == "q" || command == "quit"
  end
end
