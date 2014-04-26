require 'spec_helper'

describe Relation::Materialized do
  subject(:materialized) { relation.materialize }

  let(:relation) do
    Relation.new([[:id, Integer], [:name, String]], data)
  end

  let(:data) do
    [[1, 'Jane'], [2, 'John']]
  end

  describe '#to_ast' do
    let(:ast) do
      s(:materialized, relation.header.to_ast, data)
    end

    it 'returns an ast node representing the relation' do
      expect(materialized.to_ast).to eql(ast)
    end
  end
end
