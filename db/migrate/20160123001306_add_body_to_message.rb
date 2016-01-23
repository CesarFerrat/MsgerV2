class AddBodyToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :body1, :text
    add_column :messages, :body2, :text
    add_column :messages, :type1, :string
    add_column :messages, :type2, :string
  end
end
