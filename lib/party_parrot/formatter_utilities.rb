module PartyParrot
  module FormatterUtilities
    TEXT_DECORATION = {
      :black   => 30,
      :red     => 31,
      :green   => 32,
      :yellow  => 33,
      :blue    => 34,
      :magenta => 35,
      :cyan    => 36,
      :white   => 37,
      :bold    => 1,
    }.freeze

    def start(notification)
      @passed_count = @failed_count = @pending_count = @current_example = 0
      @example_count = notification.count
    end

    def example_started(notification)
    end

    def example_passed(notification)
      process_example(:passed)
    end

    def example_pending(notification)
      process_example(:pending)
    end

    def example_failed(notification)
      process_example(:failed)
    end

    attr_reader :current_example

    private

    def end_of_line(lines = 0)
      return "\n" if @current_example == @example_count

      if lines == 0
        "\r\n"
      else
        format("\e[1A" * (lines - 1) + "\r")
      end
    end

    def process_example(type)
      if type == :passed
        @passed_count += 1
      elsif type == :pending
        @pending_count += 1
      elsif type == :failed
        @failed_count += 1
      end

      @current_example = [@current_example + 1, @example_count].min

      output.print(current_frame_formatted)
    end

    def colorful_text(text, decoration)
      decoration_code = TEXT_DECORATION[decoration]
      "\e[#{decoration_code}m" + text + "\e[0m"
    end

    def padding(size = 0)
      " " * size
    end
  end
end
