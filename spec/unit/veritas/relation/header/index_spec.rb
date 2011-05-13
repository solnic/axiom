# encoding: utf-8

require 'spec_helper'

describe Relation::Header, '#index' do
  subject { object.index(argument) }

  let(:attribute) { [ :id, Integer ]                   }
  let(:object)    { described_class.new([ attribute ]) }

  context 'when the argument is a known attribute' do
    let(:argument) { attribute }

    it { should == 0 }
  end

  context 'when the argument is an unknown attribute' do
    let(:argument) { [ :name, String ] }

    it { should be_nil }
  end
end
