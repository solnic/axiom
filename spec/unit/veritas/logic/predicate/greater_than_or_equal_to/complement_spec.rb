require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Logic::Predicate::GreaterThanOrEqualTo#complement' do
  subject { greater_than_or_equal_to.complement }

  let(:attribute)                { Attribute::Integer.new(:id) }
  let(:greater_than_or_equal_to) { attribute.gte(1)            }

  it { should eql(attribute.lt(1)) }

  it 'is reversible' do
    subject.complement.should eql(greater_than_or_equal_to)
  end
end