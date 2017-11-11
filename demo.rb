require_relative 'spec/spec_helper'
require 'stringio'

RSpec.configure { |c| c.formatter = PartyParrotFormatter }

describe PartyParrotFormatter do
  before do
    @output = StringIO.new
    @formatter = PartyParrotFormatter.new(@output)
    @formatter.start([1])

    @samples = [123,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    sleep(0.05)
  end

  100.times do |index|
    it "should perform passing specs" do
      expect(@formatter.current_example).to eq @samples.sample
    end

    it "should perform pending specs" do
      if @samples.sample == 123
        pending('TEST purposes pending')
        expect(1).to eq 0
      end
    end
  end
end
