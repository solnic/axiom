require 'spec_helper'

describe Relation do
  describe '#join' do
    context 'without predicates' do
      subject(:join) { left.join(right) }

      let(:left) do
        Relation.new([[:user_id, Integer]], [[1]])
      end

      let(:right) do
        Relation.new([[:user_id, Integer], [:name, String]], [[1, 'Jane']])
      end

      it 'returns naturally joined relation' do
        expect(join.to_a).to eq([[1, 'Jane']])
      end
    end

    context 'with predicates' do
      subject(:join) { left.join(right, id: :user_id).project([:user_id, :name]) }

      let(:left) do
        Relation.new([[:id, Integer]], [[1], [2]])
      end

      let(:right) do
        Relation.new([[:user_id, Integer], [:name, String]], [[2, 'Jane'], [1, 'John']])
      end

      it 'returns inner joined relation using key predicates' do
        expect(join.to_a).to eq([[1, 'John'], [2, 'Jane']])
      end
    end
  end

  describe '#inner_join' do
    subject(:join) { left.join(right, id: :user_id).project([:user_id, :name]) }

    let(:left) do
      Relation.new([[:id, Integer]], [[1], [2]])
    end

    let(:right) do
      Relation.new([[:user_id, Integer], [:name, String]], [[2, 'Jane'], [1, 'John']])
    end

    it 'returns inner relation using join key' do
      expect(join.to_a).to eq([[1, 'John'], [2, 'Jane']])
    end
  end
end
