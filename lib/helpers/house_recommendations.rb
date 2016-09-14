module CasaHelpers
  module HouseRecommendations
  #  def number_of_items_sold_for(category)
  #    # returns a hash of quantity items sold for a 
  #    # particular category of items like bread, muffins, etc.
  #    all_items = Item.for_category(category).map(&:name).sort
  #    orders_list = Hash[all_items.map{|name| [name, 0]}]
  #    todays_items = OrderItem.all.map{|oi| [oi.item.name, oi.quantity] if (all_items.include?(oi.item.name) && oi.order.date == Date.today)}.compact!
  #    todays_items.each{|name, quant| orders_list[name] += quant} unless todays_items.nil?
  #    orders_list.delete_if{|key, value| value == 0}
  #    return orders_list
  #  end
#
  #  def number_of_items_sold_today
  #    # returns a hash of quantity items sold for a 
  #    # particular category of items like bread, muffins, etc.
 #     all_orders = Order.all.map(&:grand_total).where('date == ?', Date.today)
  #    sum = 0
  #    counter = 0
  #    all_orders.each do |x|
 #       sum += x
 #       counter += 1
  #    end
  #    return [sum, counter]
    end
  end  
end