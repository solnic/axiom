require "spec_helper"

describe Relation::Operation::Deletion do
  subject(:deletion) do
    left.delete([[2, 'John']])
  end

  let(:left) do
    Relation.new([[:id, Integer], [:name, String]], [[1, 'Jane'], [2, 'John']])
  end

  let(:right) do
    Relation.new([[:id, Integer], [:name, String]], [[2, 'John']])
  end

  describe '#to_ast' do
    let(:ast) do
      s(:delete, left.difference(right).to_ast)
    end

    it 'returns an ast node representing deletion' do
      expect(deletion.to_ast).to eql(ast)
    end
  end
end
