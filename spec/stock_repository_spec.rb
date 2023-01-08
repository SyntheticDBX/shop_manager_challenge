require 'stock_repository'

RSpec.describe StockRepository do
    def reset_stock_table
      seed_sql = File.read('spec/seeds_test.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
      connection.exec(seed_sql)
    end
  
    before(:each) do 
      reset_stock_table
    end
  
    it 'Get all items' do
        repo = StockRepository.new
        stocks = repo.all
        expect(stocks.length).to eq 2
        expect(stocks[0].id).to eq 1
        expect(stocks[1].name).to eq 'Plain Tees'
        expect(stocks[0].unit_price).to eq 10
        expect(stocks[1].quantity).to eq 50
    end

    it 'Adds a new item' do
        repo = StockRepository.new
        item = Stock.new
        item.name = 'Samurai Sword'
        item.unit_price = 120
        item.quantity = 5
        repo.create(item)
        all_items = repo.all
        expect(all_items.length).to eq 3
        expect(all_items.last.id).to eq 3
        expect(all_items.last.name).to eq 'Samurai Sword'
        expect(all_items.last.quantity).to eq 5
    end
end