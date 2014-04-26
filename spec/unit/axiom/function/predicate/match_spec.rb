require 'spec_helper'

describe Function::Predicate::NoMatch do
  subject(:no_match) { Function::Predicate::NoMatch.new(left, right) }

  let(:left) { Attribute.coerce([:name, String, {}]) }
  let(:right) { 'Jane' }

  describe '#to_ast' do
    it 'returns an ast node' do
      expect(no_match.to_ast).to eql(s(:no_match, left.to_ast, right))
    end
  end
end
