class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :content_source, null: false
      t.date :date
      # t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
