class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.datetime :fromDate
      t.datetime :toDate
      t.integer :numberOfGuests
      t.integer :totalAmoutOfPrice

      t.timestamps
    end
  end
end
