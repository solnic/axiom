require 'spec_helper'

describe Relation::Materialized do
  subject(:materialized) { relation.materialize }

  let(:relation) do
    Relation.new([[:id, Integer], [:name, String]], tuples)
  end

  let(:tuples) do
    [[1, 'Jane'], [2, 'John']]
  end

  describe '#to_ast' do
    let(:ast) do
      s(:materialized, relation.header.to_ast, tuples)
    end

    it 'returns an ast node representing the relation' do
      expect(materialized.to_ast).to eql(ast)
    end
  end
end
