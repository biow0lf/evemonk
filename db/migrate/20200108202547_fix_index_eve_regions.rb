# frozen_string_literal: true

class FixIndexEveRegions < ActiveRecord::Migration[6.0]
  def change
    remove_index :eve_regions, :region_id
    add_index :eve_regions, :region_id, unique: true
  end
end
