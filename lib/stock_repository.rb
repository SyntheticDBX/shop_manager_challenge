require 'stock'

class StockRepository
  def all
    sql = 'SELECT id, name, unit_price, quantity FROM stock;'
    result_set = DatabaseConnection.exec_params(sql, [])
    stocks = []
    result_set.each do |record|
      stock = Stock.new
      stock.id = record['id'].to_i
      stock.name = record['name']
      stock.unit_price = record['unit_price'].to_i
      stock.quantity = record['quantity'].to_i
      stocks << stock
    end
    return stocks
  end

  def create(item)
    sql = 'INSERT INTO stock (name, unit_price, quantity) VALUES ($1, $2, $3);'
    params = [item.name, item.unit_price, item.quantity]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end
end