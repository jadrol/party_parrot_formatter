require 'party_parrot/formatter_utilities'
require 'ostruct'

describe PartyParrot::FormatterUtilities do
  let(:notification) { OpenStruct.new(count: 123) }

  class TestFormatter
    include PartyParrot::FormatterUtilities

    def output
      @output ||= StringIO.new
    end

    def current_frame_formatted
      ""
    end
  end

  let(:instance) { TestFormatter.new }

  describe '#start' do
    subject { instance.start(notification) }

    it 'sets proper starting state' do
      subject

      expect(instance.instance_variable_get('@example_count')).to   eq 123
      expect(instance.instance_variable_get('@passed_count')).to    eq 0
      expect(instance.instance_variable_get('@failed_count')).to    eq 0
      expect(instance.instance_variable_get('@pending_count')).to   eq 0
      expect(instance.instance_variable_get('@current_example')).to eq 0
    end
  end

  context 'example incrementation' do
    before { instance.start(notification) }

    describe '#example_passed' do
      subject { instance.example_passed(notification) }

      it { expect { subject }.to change { instance.instance_variable_get('@passed_count') }.by(1) }
      it { expect { subject }.to change { instance.instance_variable_get('@current_example') }.by(1) }
    end

    describe '#example_pending' do
      subject { instance.example_pending(notification) }

      it { expect { subject }.to change { instance.instance_variable_get('@pending_count') }.by(1) }
      it { expect { subject }.to change { instance.instance_variable_get('@current_example') }.by(1) }
    end
    describe '#example_failed' do
      subject { instance.example_failed(notification) }

      it { expect { subject }.to change { instance.instance_variable_get('@failed_count') }.by(1) }
      it { expect { subject }.to change { instance.instance_variable_get('@current_example') }.by(1) }
    end
  end
end
