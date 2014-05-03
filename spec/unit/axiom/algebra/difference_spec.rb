require 'spec_helper'

describe Algebra::Difference do
  subject(:difference) { left.difference(right) }

  describe '#to_ast' do
    let(:left) do
      Relation.new(:users, [[:id, Integer], [:name, String]])
    end

    let(:right) do
      Relation.new(:users, [[:id, Integer], [:name, String]])
    end

    let(:ast) do
      s(:difference, left.to_ast, right.to_ast)
    end

    it 'returns an ast node representing difference operation' do
      expect(difference.to_ast).to eql(ast)
    end
  end
end
