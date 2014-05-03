require 'spec_helper'

describe Function::Predicate::Equality do
  subject(:equality) { Function::Predicate::Equality.new(left, right) }

  let(:left) { Attribute.coerce([:id, Integer, {}]) }
  let(:right) { 1 }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(equality.to_ast).to eql(s(:eq, left.to_ast, right))
    end
  end
end
