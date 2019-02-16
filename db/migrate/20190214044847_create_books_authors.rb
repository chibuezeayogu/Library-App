# frozen_string_literal: true

class CreateBooksAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :books_authors do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
