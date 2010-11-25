require 'spec_helper'

describe 'Veritas::Relation::Operation::Limit#limit' do
  subject { object.limit }

  let(:klass)    { Relation::Operation::Limit                                  }
  let(:relation) { Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ], [ 3 ] ]) }
  let(:order)    { relation.order                                              }
  let(:limit)    { 1                                                           }
  let(:object)   { klass.new(order, limit)                                     }

  it { should == limit }
end