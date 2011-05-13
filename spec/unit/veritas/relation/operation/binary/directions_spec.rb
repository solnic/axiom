# encoding: utf-8

require 'spec_helper'
require File.expand_path('../fixtures/classes', __FILE__)

describe Relation::Operation::Binary, '#directions' do
  subject { object.directions }

  let(:described_class) { BinaryRelationOperationSpecs::Object                                            }
  let(:left)            { Relation.new([ [ :id,   Integer ] ], [ [ 1 ] ]).order  { |r| r[:id]   }         }
  let(:right)           { Relation.new([ [ :name, String  ] ], [ [ 'Dan Kubb' ] ]).order { |r| r[:name] } }
  let(:object)          { described_class.new(left, right)                                                }

  it_should_behave_like 'an idempotent method'

  it { should be_kind_of(Relation::Operation::Order::DirectionSet) }

  it { should be_empty }
end
