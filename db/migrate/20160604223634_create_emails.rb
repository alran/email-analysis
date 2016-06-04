class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :content
      t.string :sent_to
      t.string :sent_by
      t.belongs_to :user, null: false
      t.date :sent_date
      t.timestamps null: false
    end
  end
end
