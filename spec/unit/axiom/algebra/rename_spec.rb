require "spec_helper"

describe Algebra::Rename do
  subject(:rename) do
    relation.rename(aliases)
  end

  let(:relation) do
    Relation.new([[:id, Integer], [:name, String]])
  end

  let(:aliases) do
    { id: :user_id }
  end

  describe '#to_ast' do
    let(:ast) do
      s(:rename, relation.to_ast,
        s(:aliases,
          s(:alias, relation.header[:id].to_ast, rename.header[:user_id].to_ast)
         )
       )
    end

    it 'returns an ast node representing rename' do
      expect(rename.to_ast).to eql(ast)
    end
  end
end
