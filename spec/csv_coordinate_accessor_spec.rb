require 'spec_helper'

describe CSVCoordinateAccessor do
  it 'has a version number' do
    expect(CSVCoordinateAccessor::VERSION).not_to be nil
  end

  let(:target) do
    target = CSV.read(File.expand_path('../fixtures/sample.csv', __FILE__))
    target.extend CSVCoordinateAccessor
    target
  end

  describe '#get' do
    subject { target.get(cord) }

    context '2C' do
      let(:cord) { '2C' }
      it { expect(subject).to eq('apple') }
    end
  end

  describe '#set' do
    subject { target.set(cord, value) }

    context '2C' do
      let(:cord) { '2C' }
      let(:value) { 'pineapple' }
      it { expect(subject).to eq(value) }
    end
  end

  describe '#cord2index' do
    subject { target.cord2index(cord) }

    context '2A' do
      let(:cord) { '2A' }
      it { expect(subject).to eq([1, 0]) }
    end

    context '2a' do
      let(:cord) { '2a' }
      it { expect(subject).to eq([1, 0]) }
    end

    context 'A2' do
      let(:cord) { 'A2' }
      it { expect(subject).to eq([1, 0]) }
    end

    context '3B' do
      let(:cord) { '3B' }
      it { expect(subject).to eq([2, 1]) }
    end

    context '2AA' do
      let(:cord) { '2AA' }
      it { expect(subject).to eq([1, 26]) }
    end

    context '12A' do
      let(:cord) { '12A' }
      it { expect(subject).to eq([11, 0]) }
    end

    context '12AA' do
      let(:cord) { '12AA' }
      it { expect(subject).to eq([11, 26]) }
    end

    context 'AA12' do
      let(:cord) { 'AA12' }
      it { expect(subject).to eq([11, 26]) }
    end
  end
end
