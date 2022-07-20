class AddViewsToPosters < ActiveRecord::Migration[7.0]
  def change
    add_column :posters, :views, :integer, default: 0
  end
end
