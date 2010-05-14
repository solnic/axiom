require 'spec_helper'

describe 'Veritas::Logic::Predicate::LessThan#inspect' do
  subject { less_than.inspect }

  let(:attribute) { Attribute::Integer.new(:id) }
  let(:less_than) { attribute.lt(1)             }

  it { should == "#{attribute.inspect} < 1" }
end
