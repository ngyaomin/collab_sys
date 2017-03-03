class AddPostDocumentToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post_document, :string
  end
end
