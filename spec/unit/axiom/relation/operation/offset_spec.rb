require "spec_helper"

describe Relation::Operation::Offset do
  subject(:offset) do
    Relation::Operation::Offset.new(relation, 3)
  end

  let(:relation) do
    Relation::Base.new(:users, [[:id, Integer], [:name, String]]).sort_by([:id, :name])
  end

  describe '#to_ast' do
    let(:ast) do
      s(:offset, relation.to_ast, 3)
    end

    it 'returns an ast node representing offset relation' do
      expect(offset.to_ast).to eql(ast)
    end
  end
end
