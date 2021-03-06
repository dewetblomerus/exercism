#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'pangram'

# Test data version:
# 180638f Merge pull request #217 from ErikSchierboom/patch-2

class PangramTest < Minitest::Test
  def test_sentence_empty
    str = ''
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_only_lower_case
    str = 'the quick brown fox jumps over the lazy dog'
    assert Pangram.is_pangram?(str)
  end

  def test_missing_character_x
    str = 'a quick movement of the enemy will jeopardize five gunboats'
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_mixed_case_and_punctuation
    str = '"Five quacking Zephyrs jolt my wax bed."'
    assert Pangram.is_pangram?(str)
  end

  def test_pangram_with_non_ascii_characters
    str = 'Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.'
    assert Pangram.is_pangram?(str)
  end

  def test_numbers_and_underscore
    str = 'qwertyuiopasdfghjklz_12345'
    refute Pangram.is_pangram?(str)
  end

  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of Pangram.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    assert_equal 1, Pangram::VERSION
  end
end
