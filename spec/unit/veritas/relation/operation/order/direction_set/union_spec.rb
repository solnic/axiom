require 'spec_helper'

[ :union, :| ].each do |method|
  describe "Veritas::Relation::Operation::Order::DirectionSet##{method}" do
    subject { directions.send(method, other) }

    let(:attribute1) { Attribute::Integer.new(:id)                                  }
    let(:attribute2) { Attribute::String.new(:name)                                 }
    let(:directions) { Relation::Operation::Order::DirectionSet.new([ attribute1 ]) }
    let(:other)      { Relation::Operation::Order::DirectionSet.new([ attribute2 ]) }

    it { should be_kind_of(Relation::Operation::Order::DirectionSet) }

    it { should == [ attribute1.asc, attribute2.asc ] }
  end
end
