require "spec_helper"

describe Relation::Operation::Limit do
  subject(:limit) do
    Relation::Operation::Limit.new(relation, 3)
  end

  let(:relation) do
    Relation::Base.new(:users, [[:id, Integer], [:name, String]]).sort_by([:id, :name])
  end

  describe '#to_ast' do
    let(:ast) do
      s(:limit, relation.to_ast, 3)
    end

    it 'returns an ast node representing limit relation' do
      expect(limit.to_ast).to eql(ast)
    end
  end
end
