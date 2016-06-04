class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, uniqueness: true
      # t.belongs_to :admin

      t.timestamps null: false
    end
  end
end
