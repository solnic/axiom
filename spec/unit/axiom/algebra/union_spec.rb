require 'spec_helper'

describe Algebra::Union do
  subject(:union) { left.union(right) }

  describe '#to_ast' do
    let(:left) do
      Relation::Base.new(:users, [[:id, Integer], [:name, String]])
    end

    let(:right) do
      Relation::Base.new(:users, [[:id, Integer], [:name, String]])
    end

    let(:ast) do
      s(:union, left.to_ast, right.to_ast)
    end

    it 'returns an ast node representing the relation' do
      expect(union.to_ast).to eql(ast)
    end
  end
end
