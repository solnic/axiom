require 'spec_helper'

describe 'Veritas::Logic::Connective::Conjunction#optimize' do
  subject { conjunction.optimize }

  let(:attribute) { Attribute::Integer.new(:id) }

  context 'left and right are predicates' do
    let(:left)        { attribute.gt(1)                                 }
    let(:right)       { attribute.lt(3)                                 }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(conjunction) }
  end

  context 'left and right are negated predicates' do
    let(:conjunction) do
      Logic::Connective::Conjunction.new(
        Logic::Connective::Negation.new(attribute.gt(1)),
        Logic::Connective::Negation.new(attribute.lt(3))
      )
    end

    it { should_not equal(conjunction) }

    it 'reverses the operands' do
      should eql(Logic::Connective::Conjunction.new(attribute.lte(1), attribute.gte(3)))
    end
  end

  context 'left and right are the same' do
    let(:left)        { attribute.gt(1)                                 }
    let(:right)       { attribute.gt(1)                                 }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should eql(left) }
  end

  context 'left and right are true propositions' do
    let(:left)        { Logic::Proposition::True.instance               }
    let(:right)       { Logic::Proposition::True.instance               }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(Logic::Proposition::True.instance) }
  end

  context 'left and right are false propositions' do
    let(:left)        { Logic::Proposition::False.instance              }
    let(:right)       { Logic::Proposition::False.instance              }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(Logic::Proposition::False.instance) }
  end

  context 'right is a true proposition' do
    let(:left)        { attribute.gt(1)                                 }
    let(:right)       { Logic::Proposition::True.instance               }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(left) }
  end

  context 'left is a true proposition' do
    let(:left)        { Logic::Proposition::True.instance               }
    let(:right)       { attribute.lt(3)                                 }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(right) }
  end

  context 'right is a false proposition' do
    let(:left)        { attribute.gt(1)                                 }
    let(:right)       { Logic::Proposition::False.instance              }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(Logic::Proposition::False.instance) }
  end

  context 'left is a false proposition' do
    let(:left)        { Logic::Proposition::False.instance              }
    let(:right)       { attribute.lt(3)                                 }
    let(:conjunction) { Logic::Connective::Conjunction.new(left, right) }

    it { should equal(Logic::Proposition::False.instance) }
  end
end
