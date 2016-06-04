class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :content_source, null: false
      t.date :date

      t.timestamps null: false
    end
  end
end
