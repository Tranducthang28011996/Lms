class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :image
      t.integer :status
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
