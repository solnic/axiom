require 'spec_helper'

describe 'Veritas::Logic::Predicate::Equality#inspect' do
  subject { equality.inspect }

  let(:attribute) { Attribute::Integer.new(:id) }
  let(:equality)  { attribute.eq(1)             }

  it { should == "#{attribute.inspect} == 1" }
end
