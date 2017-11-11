require 'party_parrot/formatters/rspec3/base'
require 'ostruct'

describe PartyParrot::Formatters::RSpec3::Base do
  it { expect(described_class.ancestors).to include(PartyParrot::FormatterUtilities) }

  let(:output) { StringIO.new }

  let(:instance) { described_class.new(output) }

  describe '#dump_summary' do
    let(:notification) { OpenStruct.new(duration: 123.12) }

    subject { instance.dump_summary(notification) }

    it 'prints proper summary' do
      subject
      output.rewind
      expect(output.read).to eq("You've partied for 123.12 seconds")
    end
  end
end
