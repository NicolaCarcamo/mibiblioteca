class AddFechaprestamoToBiblioteca < ActiveRecord::Migration[6.1]
  def change
    add_column :bibliotecas, :fechaprestamo, :date
  end
end
