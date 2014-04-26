require 'spec_helper'

describe Function::Predicate::Inclusion do
  subject(:inclusion) { left.exclude(right) }

  let(:left) { Attribute.coerce([:id, Integer, {}]) }
  let(:right) { [1] }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(inclusion.to_ast).to eql(s(:ex, left.to_ast, right))
    end
  end
end
