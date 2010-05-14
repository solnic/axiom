require 'spec_helper'

describe 'Veritas::Relation::Operation::Order::DirectionSet#hash' do
  subject { directions.hash }

  let(:attribute)  { Attribute::Integer.new(:id)                                 }
  let(:directions) { Relation::Operation::Order::DirectionSet.new([ attribute ]) }

  it { should be_kind_of(Integer) }

  it { should == [ attribute.asc ].hash }
end
