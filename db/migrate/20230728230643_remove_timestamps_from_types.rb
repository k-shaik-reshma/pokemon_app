class RemoveTimestampsFromTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :types, :timestamps
  end
end
