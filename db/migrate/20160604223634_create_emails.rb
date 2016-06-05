class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :content
      t.string :sent_to
      t.string :google_id
      t.string :sent_by
      t.string :sentiment
      t.decimal :sentiment_score, precision: 7
      t.belongs_to :user, null: false
      t.date :sent_date
      t.timestamps null: false
    end
  end
end
