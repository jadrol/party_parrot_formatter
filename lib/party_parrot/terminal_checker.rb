module PartyParrot
  module TerminalChecker
    class << self
      def terminal_size
        @terminal_size ||= (
          sizes_array = `stty size`.split(' ').map(&:to_i)
          { height: sizes_array.first, width: sizes_array.last }
        )
      end

      def suitable_for_terminal?(formatter)
        terminal_size[:width] > formatter::MINIMAL_TERMINAL_WIDTH
      end
    end
  end
end
