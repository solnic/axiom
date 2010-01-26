require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Rename#optimize' do
  before do
    @relation = Relation.new([ [ :id, Integer ], [ :name, String ] ], [ [ 1, 'Dan Kubb' ] ])
  end

  subject { @rename.optimize }

  describe 'containing a relation' do
    before do
      @rename = Algebra::Rename.new(@relation, :id => :other_id)
    end

    it { should equal(@rename) }
  end

  describe 'containing an empty relation' do
    before do
      @empty = Relation::Empty.new(@relation.header)

      @rename = Algebra::Rename.new(@empty, :id => :other_id)
    end

    it { should eql(Relation::Empty.new(@rename.header)) }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing an optimizable relation' do
    before do
      @projection = @relation.project(@relation.header)

      @rename = Algebra::Rename.new(@projection, :id => :other_id)
    end

    it { should_not equal(@rename) }

    it { should be_instance_of(Algebra::Rename) }

    it 'should set aliases the same as the original rename' do
      subject.aliases.should == @rename.aliases
    end

    it { subject.relation.should equal(@relation) }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing a rename operation' do
    before do
      @rename = Algebra::Rename.new(@relation, :id   => :other_id)
      @rename = Algebra::Rename.new(@rename,   :name => :other_name)
    end

    it { should_not equal(@rename) }

    it { should be_instance_of(Algebra::Rename) }

    it 'should set aliases as a union of both aliases' do
      subject.aliases.should == { :id => :other_id, :name => :other_name }
    end

    it { subject.relation.should equal(@relation) }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing a rename operation with overlapping aliases' do
    before do
      @rename = Algebra::Rename.new(@relation, :id       => :other_id)
      @rename = Algebra::Rename.new(@rename,   :other_id => :another_id)
    end

    it { should_not equal(@rename) }

    it { should be_instance_of(Algebra::Rename) }

    it 'should set aliases as a union of both aliases' do
      subject.aliases.should == { :id => :another_id }
    end

    it { subject.relation.should equal(@relation) }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing an inverse rename operation' do
    before do
      @rename = Algebra::Rename.new(@relation, :id       => :other_id)
      @rename = Algebra::Rename.new(@rename,   :other_id => :id)
    end

    it { should equal(@relation) }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing a projection' do
    before do
      @projection = @relation.project([ :id ])

      @rename = Algebra::Rename.new(@projection, :id => :other_id)
    end

    it { should be_instance_of(Algebra::Projection) }

    it { subject.relation.should eql(Algebra::Rename.new(@relation, :id => :other_id)) }

    it { subject.header.should == [ [ :other_id, Integer ] ] }

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'containing a set operation' do
    before do
      @left  = Relation.new([ [ :id, Integer ], [ :name, String ] ], [ [ 1, 'Dan Kubb' ] ])
      @right = Relation.new([ [ :id, Integer ], [ :name, String ] ], [ [ 2, 'Dan Kubb' ] ])
      @union = @left.union(@right)

      @rename = @union.rename(:id => :other_id)
    end

    it 'should push the rename to each relation' do
      should eql(Algebra::Union.new(
         Algebra::Rename.new(@left,  :id => :other_id),
         Algebra::Rename.new(@right, :id => :other_id)
      ))
    end

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'with a reverse operation' do
    before do
      @limit   = @relation.order(@relation.header).limit(1)
      @reverse = @limit.reverse

      @rename = @reverse.rename(:id => :other_id)
    end

    it 'should push the rename under the reverse' do
      should eql(Relation::Operation::Reverse.new(
        Algebra::Rename.new(@limit, :id => :other_id)
      ))
    end

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end

  describe 'with an order operation' do
    before do
      @order = @relation.order(@relation.header)

      @rename = @order.rename(:id => :other_id)
    end

    it 'should push the rename under the order' do
      should eql(Relation::Operation::Order.new(
        Algebra::Rename.new(@relation, :id => :other_id),
        @rename.directions
      ))
    end

    it 'should return the same tuples as the unoptimized operation' do
      should == @rename
    end
  end
end
