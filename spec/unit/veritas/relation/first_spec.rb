require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Relation#first' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ], [ 3 ] ])
    @ordered  = @relation.order { |r| r[:id] }
  end

  describe 'with no arguments' do
    subject { @ordered.first }

    it { should be_kind_of(Relation::Operation::Limit) }

    it 'should return the expected tuples' do
      should == [ [ 1 ] ]
    end

    it 'should behave the same as Array#first' do
      should == [ @ordered.to_a.first ]
    end
  end

  describe 'with a limit' do
    subject { @ordered.first(2) }

    it { should be_kind_of(Relation::Operation::Limit) }

    it 'should return the expected tuples' do
      should == [ [ 1 ], [ 2 ] ]
    end

    it 'should behave the same as Array#first' do
      should == @ordered.to_a.first(2)
    end
  end
end
