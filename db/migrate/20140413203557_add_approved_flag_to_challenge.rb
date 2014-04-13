class AddApprovedFlagToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :approved, :boolean
  end
end
