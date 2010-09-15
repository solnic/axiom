require 'spec_helper'

describe 'Veritas::Logic::Predicate::LessThanOrEqualTo.call' do
  subject { Logic::Predicate::LessThanOrEqualTo.call(left, right) }

  context 'when left is equal to right' do
    let(:left)  { 1 }
    let(:right) { 1 }

    it { should be(true) }
  end

  context 'when left is greater than right' do
    let(:left)  { 2 }
    let(:right) { 1 }

    it { should be(false) }
  end

  context 'when left is less than right' do
    let(:left)  { 1 }
    let(:right) { 2 }

    it { should be(true) }
  end
end