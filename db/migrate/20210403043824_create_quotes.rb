class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :quote_submitter
      t.string :channel
      t.text :message

      t.timestamps
    end
  end
end
