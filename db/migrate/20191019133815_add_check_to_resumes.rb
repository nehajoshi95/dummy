class AddCheckToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :check, :string
  end
end
