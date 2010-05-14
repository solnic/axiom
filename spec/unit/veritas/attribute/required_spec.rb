require 'spec_helper'

describe 'Veritas::Attribute#required?' do
  subject { attribute.required? }

  context 'without :required option passed to constructor' do
    let(:attribute) { Attribute::Integer.new(:id) }

    it { should be(true) }
  end

  context 'with :required => true option passed to constructor' do
    let(:attribute) { Attribute::Integer.new(:id, :required => true) }

    it { should be(true) }
  end

  context 'with :required => false option passed to constructor' do
    let(:attribute) { Attribute::Integer.new(:id, :required => false) }

    it { should be(false) }
  end
end
