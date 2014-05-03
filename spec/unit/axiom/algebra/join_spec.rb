require "spec_helper"

describe Algebra::Join do
  let(:left) do
    Relation.new([[:id, Integer], [:name, String]])
  end

  let(:right) do
    Relation.new([[:id, Integer], [:user_id, Integer], [:title, String]])
  end

  describe '#to_ast' do
    context 'with a non-restricted join' do
      subject(:join) { left.join(right) }

      let(:ast) do
        s(:join, left.to_ast, right.to_ast)
      end

      it 'returns an ast node representing the join' do
        expect(join.to_ast).to eql(ast)
      end
    end

    context 'with a restricted join' do
      subject(:join) { left.join(right) { |r| r.id.eq(r.user_id) } }

      let(:ast) do
        s(:restrict,
          s(:join, left.to_ast, right.to_ast),
          s(:eq, left.header[:id].to_ast, right.header[:user_id].to_ast)
         )
      end

      it 'returns an ast node representing the join' do
        expect(join.to_ast).to eql(ast)
      end
    end

    context 'with join key predicates' do
      subject(:join) { left.join(right, :id => :user_id) }

      let(:ast) do
        s(:join,
          join.left.to_ast,
          join.right.to_ast,
          s(:join_predicates,
            s(:join_key, left.header[:id].to_ast, right.header[:user_id].to_ast)
           )
         )
      end

      it 'returns an ast node representing the join with predicate keys' do
        expect(join.to_ast).to eql(ast)
      end
    end
  end
end
