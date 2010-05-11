require File.expand_path('../../../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

methods = [ :complement ]
methods << '!' if respond_to?('!')  # available in Ruby 1.9

methods.each do |method|
  describe "Veritas::Logic::Expression##{method}" do
    subject { expression.send(method) }

    let(:expression) { ExpressionSpecs::Object.new }

    before do
      def expression.eql?(other)
        equal?(other)
      end
    end

    it 'returns a negated expression' do
      should eql(Logic::Connective::Negation.new(expression))
    end
  end
end