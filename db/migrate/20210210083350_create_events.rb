class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :eventName
      t.datetime :stime
      t.datetime :etime

      t.timestamps
    end
  end
end
