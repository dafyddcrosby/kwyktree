# frozen_string_literal: true

require "test_helper"

class KwykTreeTest < Minitest::Test
  def setup
    @units = [
      [::KwykTree::Concept.new("name" => "foo"), {
        id: "concept.foo",
        label: '{Foo|grok: false\nanki: false\n}'
      }],
      [::KwykTree::Implementation.new("name" => "bad_brains"), {
        id: "implementation.bad_brains",
        label: '{Bad brains|grok: false\nanki: false\n}'
      }]
    ]
  end

  def test_that_it_has_a_version_number
    refute_nil ::KwykTree::VERSION
  end

  def test_units
    @units.each do |u|
      assert_equal u[0].graphviz_id, u[1][:id]
      assert_equal u[0].graphviz_record_label, u[1][:label]
    end
  end
end
