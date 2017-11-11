require 'party_parrot/formatters/rspec3/base'
require 'party_parrot/terminal_checker'

formatter = PartyParrot::Formatters::RSpec3::Base

unless PartyParrot::TerminalChecker.suitable_for_terminal?(formatter)
  puts "PartyParrotFormatter not available for this terminal width, minimal width is #{formatter::MINIMAL_TERMINAL_WIDTH}. Defaulting to progress formatter."
  require 'rspec/core/formatters/progress_formatter'
  formatter = RSpec::Core::Formatters::ProgressFormatter
end

PartyParrotFormatter = formatter
