class RenameNameToComment < ActiveRecord::Migration[8.0]
    def change
      rename_column :bookmarks, :name, :comment
    end
end
