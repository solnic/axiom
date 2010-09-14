require 'bigdecimal'
require 'date'
require 'set'
require 'singleton'

require 'veritas/core_ext/date'
require 'veritas/core_ext/range'
require 'veritas/core_ext/time'

require 'veritas/support/abstract_class'
require 'veritas/support/aliasable'
require 'veritas/support/immutable'
require 'veritas/support/optimizable'

require 'veritas/support/operation/binary'
require 'veritas/support/operation/unary'

require 'veritas/support/evaluator'

require 'veritas/logic'
require 'veritas/relation'
require 'veritas/algebra'

require 'veritas/optimizer'
require 'veritas/attribute'
require 'veritas/tuple'
require 'veritas/version'

module Veritas
  class InvalidHeaderError           < ArgumentError; end
  class InvalidLimitError            < ArgumentError; end
  class InvalidOffsetError           < ArgumentError; end
  class InvalidDirectionsError       < ArgumentError; end
  class OrderedRelationRequiredError < StandardError; end
  class RelationMismatchError        < StandardError; end
  class DuplicateHeaderName          < StandardError; end

  TABLE_DUM = Relation.new([], [    ]).optimize
  TABLE_DEE = Relation.new([], [ [] ]).optimize
end
