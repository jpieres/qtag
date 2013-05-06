class AddImageColumnToTags < ActiveRecord::Migration
  def change
   add_attachment :tags, :image
  end
end
