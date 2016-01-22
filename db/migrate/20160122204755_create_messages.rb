class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id
      t.string :from
      t.string :to
      t.datetime :date
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
