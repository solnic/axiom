require "spec_helper"

describe Relation::Operation::Reverse do
  subject(:reversed) do
    relation.reverse
  end

  let(:relation) do
    Relation::Base.new(:users, [[:id, Integer], [:name, String]]).sort_by([:id, :name])
  end

  describe '#to_ast' do
    let(:ast) do
      s(:sorted,
        relation.to_ast,
        s(:directions, s(:direction, :id, :desc), s(:direction, :name, :desc))
       )
    end

    it 'returns an ast node representing reversed relation' do
      expect(reversed.to_ast).to eql(ast)
    end
  end
end
