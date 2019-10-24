class AddcategoryIdtoresumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :category_id, :integer
  end
end
