class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.date :work_date
      t.time :start_time
      t.time :end_time
      t.text :memo

      t.timestamps
    end
  end
end
