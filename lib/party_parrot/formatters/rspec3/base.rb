require 'rspec/core/formatters/base_text_formatter'
require 'party_parrot/formatter_utilities'

module PartyParrot
  module Formatters
    module RSpec3
      class Base < RSpec::Core::Formatters::BaseTextFormatter
        RSpec::Core::Formatters.register self, :start, :example_started, :example_passed, :example_pending, :example_failed

        include PartyParrot::FormatterUtilities

        MINIMAL_TERMINAL_WIDTH = 90

        def initialize(output)
          super(output)
        end

        def dump_summary(notification)
          output.print("You've partied for #{notification.duration} seconds")
        end

        private

        attr_reader :output, :example_count

        def current_frame_formatted
          frame = frames[@current_example % frames.size].split("\n")
          frame = inject_stats(frame)
          frame.join("\n") + end_of_line(frame.size)
        end

        def frames
          # Handle gem file loading in application
          @frames ||= Dir["#{File.expand_path('../../../../../', __FILE__)}/data/txt/*.txt"].map do |path|
            frame = File.read(path).split("\n")
            frame.map! { |line| line.size >= 50 ? line : line + (" " * (60 - line.size)) }.join("\n")
          end
        end

        def inject_stats(frame)
          # total
          frame[2] = frame[2] + colorful_text("#{padding(10)}total:   #{@current_example}/#{@example_count}", :bold)
          # success
          frame[3] = frame[3] + colorful_text("#{padding(10)}success: #{@passed_count}/#{@example_count}", :green)
          # failed
          frame[4] = frame[4] + colorful_text("#{padding(10)}failed:  #{@failed_count}/#{@example_count}", :red)
          # pending
          frame[5] = frame[5] + colorful_text("#{padding(10)}pending: #{@pending_count}/#{@example_count}", :yellow)

          frame
        end
      end
    end
  end
end
