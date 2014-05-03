require 'spec_helper'

describe Function::Predicate::GreaterThanOrEqualTo do
  subject(:greater_than) { left.gte(right) }

  let(:left) { Attribute.coerce([:id, Integer, {}]) }
  let(:right) { 1 }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(greater_than.to_ast).to eql(s(:gte, left.to_ast, right))
    end
  end
end
