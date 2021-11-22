class AddFechadevoluciontamoToBiblioteca < ActiveRecord::Migration[6.1]
  def change
    add_column :bibliotecas, :fechadevolucion, :date
  end
end
