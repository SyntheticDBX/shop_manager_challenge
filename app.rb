require 'pg'

require_relative 'lib/database_connection'
require_relative 'lib/stock'
require_relative 'lib/stock_repository'
require_relative 'lib/order'
require_relative 'lib/order_repository'

class Application
    def initialize(database_name, io, stock_repository, order_repository)
        DatabaseConnection.connect(database_name)
        @io = io
        @stock_repository = stock_repository
        @order_repository = order_repository
    end

    def add_stock
        stock = Stock.new
        @io.puts "Enter stock name: "
        stock.name = @io.gets.chomp
        @io.puts "Enter stock price: "
        stock.unit_price = @io.gets.chomp
        @io.puts "Enter stock quantity: "
        stock.quantity = @io.gets.chomp
        @stock_repository.create(stock)
    end

    def add_order
        order = Order.new
        @io.puts "Enter customer name: "
        order.customer_name = @io.gets.chomp
        @io.puts "Enter order date: "
        order.order_date = @io.gets.chomp
        @io.puts "Enter item_id: "
        order.item_id = @io.gets.chomp
        @order_repository.create(order)
    end

    def display_menu
        @io.puts "Shop Manager................"   
        @io.puts "    [1]  view all items "           
        @io.puts "    [2]  view all orders"
        @io.puts "    [3]  add new item"
        @io.puts "    [4]  add new order"
        @io.puts "    [5]  update item name"  
        @io.puts "    [6]  update item price"
        @io.puts "    [7]  update item quantity"   
       
    
        @io.puts "............................."
          
        @io.puts " Select an option[ ]"
        selected_option = @io.gets.chomp
        if selected_option == '1'
              then view_stocks
        elsif selected_option == '2'
              then view_orders
        elsif selected_option == '3'
              then add_stock
        elsif selected_option == '4'
              then add_order
        elsif selected_option == '5'
              then update_stock_name
        elsif selected_option == '6'
              then update_stock_price
        elsif selected_option == '7'
          then update_stock_quantity
        end
    end
end