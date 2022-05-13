# frozen_string_literal: true

require "ruby-graphviz"

module KwykTree
  class Unit
    attr_reader :deps, :url

    def initialize(unit)
      if unit["name"]
        @name = unit["name"]
      else
        raise "unit needs a name"
      end

      @details = {
        "anki" => unit["anki"] || false,
        "grok" => unit["grok"] || false
      }
      @desc = unit["desc"] || ""
      @url = unit["url"] if unit["url"]
      @deps = unit["deps"] || []
      @deps.each(&:downcase!)
      @title = unit["title"] || pretty_name
    end

    def type
      raise "unit needs to be subclassed!"
    end

    def graphviz_record_label
      # TODO: add desc
      "{#{@title}#{graphviz_details}}"
    end

    def graphviz_id
      "#{type}.#{@name.downcase.tr(" ", "_")}"
    end

    def graphviz_attributes
      hsh = {
        tooltip: @title,
        label: graphviz_record_label,
        shape: graphviz_record_shape
      }
      hsh[:URL] = @url if @url
      hsh
    end

    def graphviz_record_shape
      raise "unit needs to be subclassed!"
    end

    private

    def pretty_name
      # Not perfect, but fine for now
      @name.capitalize.tr("_", " ")
    end

    def graphviz_details
      details_bar = ""
      details = String.new
      if @details["grok"] != true
        details_bar = "|"
        details << 'grok: false\\n'
      end
      if @details["anki"] != true
        details_bar = "|"
        details << 'anki: false\\n'
      end
      "#{details_bar}#{details}"
    end
  end

  class Concept < Unit
    def type
      "concept"
    end

    def graphviz_record_shape
      "Mrecord"
    end
  end

  class Implementation < Unit
    def type
      "implementation"
    end

    def graphviz_record_shape
      "record"
    end
  end
end
