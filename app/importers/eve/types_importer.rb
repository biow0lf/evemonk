# frozen_string_literal: true

module Eve
  class TypesImporter
    attr_reader :page

    def initialize(page = 1)
      @page = page
    end

    def import
    end
  end
end
