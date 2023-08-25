class CreateStreamingService < ActiveRecord::Migration[7.0]
  def change
    create_table :streaming_services do |t|
      t.string :name
      t.boolean :subscribed
      t.boolean :logged_in
      t.integer :rating

      t.timestamps
    end
  end
end
