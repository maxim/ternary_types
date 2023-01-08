require 'bundler/setup'
require 'minitest/autorun'
require 'ternary_types'

class TernaryTypesTest < MiniTest::Test
  T = TernaryTypes::True.instance
  F = TernaryTypes::False.instance
  M = TernaryTypes::Maybe.instance

  include TernaryTypes::Coersion

  def assert_true(exp, str)
    assert exp.true?, "Expected #{str} to evaluate to #{T}, got #{exp}"
  end

  def assert_maybe(exp, str)
    assert exp.maybe?, "Expected #{str} to evaluate to #{M}, got #{exp}"
  end

  def assert_false(exp, str)
    assert exp.false?, "Expected #{str} to evaluate to #{F}, got #{exp}"
  end

  def test_equals
    assert_true T == T, 'T == T'
    assert_true F == F, 'F == F'
    assert_maybe M == M, 'M == M'
  end

  def test_not
    assert_false !T, '!T'
    assert_true !F, '!F'
    assert_maybe !M, '!M'
  end

  #   | F M T
  # --+-------
  # F | F F F
  # M | F M M
  # T | F M T
  def test_and
    assert_false F & F, 'F & F'
    assert_false F & M, 'F & M'
    assert_false F & T, 'F & T'

    assert_false M & F, 'M & F'
    assert_maybe M & M, 'M & M'
    assert_maybe M & T, 'M & T'

    assert_false T & F, 'T & F'
    assert_maybe T & M, 'T & M'
    assert_true  T & T, 'T & T'
  end

  #   | F M T
  # --+-------
  # F | F M T
  # M | M M T
  # T | T T T
  def test_or
    assert_false F | F, 'F | F'
    assert_maybe F | M, 'F | M'
    assert_true  F | T, 'F | T'

    assert_maybe M | F, 'M | F'
    assert_maybe M | M, 'M | M'
    assert_true  M | T, 'M | T'

    assert_true  T | F, 'T | F'
    assert_true  T | M, 'T | M'
    assert_true  T | T, 'T | T'
  end

  #   | F M T
  # --+-------
  # F | F M T
  # M | M M M
  # T | T M F
  def test_xor
    assert_false F ^ F, 'F ^ F'
    assert_maybe F ^ M, 'F ^ M'
    assert_true  F ^ T, 'F ^ T'

    assert_maybe M ^ F, 'M ^ F'
    assert_maybe M ^ M, 'M ^ M'
    assert_maybe M ^ T, 'M ^ T'

    assert_true  T ^ F, 'T ^ F'
    assert_maybe T ^ M, 'T ^ M'
    assert_false T ^ T, 'T ^ T'
  end

  def test_coersion
    assert_true  Ternary(T),       'Ternary(T)'
    assert_maybe Ternary(M),       'Ternary(M)'
    assert_false Ternary(F),       'Ternary(F)'
    assert_maybe Ternary(:maybe),  'Ternary(:maybe)'
    assert_true  Ternary(:object), 'Ternary(:object)'
    assert_false Ternary(false),   'Ternary(false)'
    assert_false Ternary(nil),     'Ternary(nil)'
  end
end
