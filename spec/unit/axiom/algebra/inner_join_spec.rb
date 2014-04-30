require "spec_helper"

describe Algebra::Join::Inner do
  let(:left) do
    Relation.new([[:id, Integer], [:name, String]])
  end

  let(:right) do
    Relation.new([[:id, Integer], [:user_id, Integer], [:title, String]])
  end

  describe '#to_ast' do
    context 'without restriction' do
      subject(:join) { left.join(right, :id => :user_id) }

      let(:ast) do
        s(:join,
          left.to_ast,
          right.to_ast,
          s(:keys,
            s(:eq, left.header[:id], right.header[:user_id])
           )
         )
      end

      it 'returns an ast node representing the inner join with join keys' do
        expect(join.to_ast).to eql(ast)
      end
    end
  end
end
