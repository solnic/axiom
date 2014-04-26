require 'spec_helper'

describe Function::Predicate::Inequality do
  subject(:inequality) { Function::Predicate::Inequality.new(left, right) }

  let(:left) { Attribute.coerce([:id, Integer, {}]) }
  let(:right) { 1 }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(inequality.to_ast).to eql(s(:ne, left.to_ast, right))
    end
  end
end
