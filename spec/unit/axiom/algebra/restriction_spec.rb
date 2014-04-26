require "spec_helper"

describe Algebra::Restriction do
  subject(:restriction) do
    relation.restrict(operand)
  end

  let(:relation) do
    Relation.new([[:id, Integer], [:name, String]])
  end

  let(:operand) do
    { id: 1 }
  end

  describe '#to_ast' do
    let(:ast) do
      s(:restrict, relation.to_ast, s(:eq, relation.header[:id].to_ast, 1))
    end

    it 'returns an ast node representing restriction' do
      expect(restriction.to_ast).to eql(ast)
    end
  end
end
