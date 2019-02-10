# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :firstName
      t.string :lastName
      t.string :displayName
      t.string :phone
      t.string :gender
      t.text :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
