require 'spec_helper'

describe 'Veritas::Logic::Expression.eval' do
  subject { klass.eval }

  let(:klass) do
    Class.new(Logic::Expression) do
      def self.name
        'AnonymousClass'
      end
    end
  end

  specify { method(:subject).should raise_error(NotImplementedError, 'AnonymousClass.eval must be implemented') }
end
