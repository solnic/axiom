require "spec_helper"

describe Relation::Operation::Insertion do
  subject(:insertion) do
    left.insert(tuples)
  end

  let(:left) do
    Relation.new([[:id, Integer], [:name, String]])
  end

  let(:right) do
    Relation::Materialized.new([[:id, Integer], [:name, String]], tuples)
  end

  let(:tuples) do
    [[1, 'Jane'], [2, 'John']]
  end

  describe '#to_ast' do
    let(:ast) do
      s(:insert, left.union(right).to_ast)
    end

    it 'returns an ast node representing insertion' do
      expect(insertion.to_ast).to eql(ast)
    end
  end
end
