require 'party_parrot/terminal_checker'

describe PartyParrot::TerminalChecker do
  describe '.terminal_size' do
    let(:height) { 25 }
    let(:width) { 160 }

    subject { described_class.terminal_size }

    before { expect(described_class).to receive(:`).with('stty size').and_return("#{height} #{width}") }

    it { is_expected.to eq({ height: height, width: width }) }
  end

  describe '.suitable_for_terminal?' do
    class TestFormatter
      MINIMAL_TERMINAL_WIDTH = 90
    end

    subject { described_class.suitable_for_terminal?(TestFormatter) }

    before { allow(described_class).to receive(:terminal_size).and_return({ width: terminal_width }) }

    context 'when terminal width is good enough' do
      let(:terminal_width) { 91 }

      it { is_expected.to eq true }
    end

    context 'when terminal width is too small' do
      let(:terminal_width) { 45 }

      it { is_expected.to eq false }
    end
  end
end
