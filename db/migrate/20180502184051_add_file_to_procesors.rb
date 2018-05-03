class AddFileToProcesors < ActiveRecord::Migration[5.2]
  def change
    add_attachment :procesors, :document
  end
end
