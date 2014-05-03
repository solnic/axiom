require 'spec_helper'

describe Function::Predicate::Match do
  subject(:match) { Function::Predicate::Match.new(left, right) }

  let(:left) { Attribute.coerce([:name, String, {}]) }
  let(:right) { 'Jane' }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(match.to_ast).to eql(s(:match, left.to_ast, right))
    end
  end
end
