# frozen_string_literal: true

module Eve
  class PlanetDecorator < ApplicationDecorator
    decorates_associations :system, :type, :position
  end
end
