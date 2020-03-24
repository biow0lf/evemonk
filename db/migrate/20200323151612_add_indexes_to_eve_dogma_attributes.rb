# frozen_string_literal: true

class AddIndexesToEveDogmaAttributes < ActiveRecord::Migration[6.0]
  def change
    add_index :eve_dogma_attributes, :name
  end
end
