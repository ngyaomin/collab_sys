class UpdateMultipleUploadsToPost < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :post_document, "varchar[] USING (string_to_array(post_document, ','))"
  end
end
