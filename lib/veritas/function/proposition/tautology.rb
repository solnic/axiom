module Veritas
  class Function
    class Proposition

      # A class representing a tautology
      class Tautology < Proposition

        # Return the inverse proposition class
        #
        # @example
        #   Tautology.inverse  # => Contradiction
        #
        # @return [Class<Contradiction>]
        #
        # @api public
        def self.inverse
          Contradiction
        end

        # Evaluate the proposition
        #
        # @example
        #   Tautology.call  # => true
        #
        # @return [true]
        #
        # @api public
        def self.call
          true
        end

        # Logically AND the proposition with another expression
        #
        # @example
        #   tautology.and(other)  # => other
        #
        # @param [Function] other
        #
        # @return [Function]
        #
        # @api public
        def and(other)
          other
        end

        # Logically OR the proposition with another expression
        #
        # @example
        #   tautology.or(other)  # => tautology
        #
        # @param [Function] other
        #
        # @return [self]
        #
        # @api public
        def or(other)
          self
        end

      end # class Tautology
    end # class Proposition
  end # module Algebra
end # module Veritas
