require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Relation#limit' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ])
    @ordered  = @relation.order { |r| r[:id] }
  end

  subject { @ordered.limit(1) }

  it { should be_kind_of(Relation::Operation::Limit) }

  it 'should behave the same as Array#take' do
    should == @ordered.to_a.take(1)
  end
end
