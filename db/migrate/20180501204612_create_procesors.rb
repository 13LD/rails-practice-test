class CreateProcesors < ActiveRecord::Migration[5.2]
  def change
    create_table :procesors do |t|

      t.timestamps
    end
  end
end
