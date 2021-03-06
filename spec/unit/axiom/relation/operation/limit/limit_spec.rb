# encoding: utf-8

require 'spec_helper'

describe Relation::Operation::Limit, '#limit' do
  subject { object.limit }

  let(:relation) { Relation.new([[:id, Integer]], [[1], [2], [3]]) }
  let(:sorted)   { relation.sort_by { |r| r.id }                   }
  let(:limit)    { 1                                               }
  let(:object)   { described_class.new(sorted, limit)              }

  it { should == limit }
end
