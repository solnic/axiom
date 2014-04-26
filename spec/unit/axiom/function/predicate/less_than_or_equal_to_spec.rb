require 'spec_helper'

describe Function::Predicate::LessThanOrEqualTo do
  subject(:less_than) { left.lte(right) }

  let(:left) { Attribute.coerce([:id, Integer, {}]) }
  let(:right) { 1 }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(less_than.to_ast).to eql(s(:lte, left.to_ast, right))
    end
  end
end
