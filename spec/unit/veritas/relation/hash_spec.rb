require 'spec_helper'

describe 'Veritas::Relation#hash' do
  subject { relation.hash }

  let(:relation) { Relation.new([ [ :id, Integer ] ], []) }

  it { should be_kind_of(Integer) }

  it { should == relation.header.hash ^ relation.to_set.hash }
end
