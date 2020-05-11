# frozen_string_literal: true

require "rails_helper"

describe Eve::ImplantDecorator do
  subject { described_class.new(double) }

  it { should be_an(Eve::TypeDecorator) }
end
