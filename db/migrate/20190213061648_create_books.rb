# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :publisher
      t.integer :quantity
      t.boolean :is_avaliable
      t.boolean :is_deleted
      t.references :author
      t.references :genre

      t.timestamps
    end
  end
end
