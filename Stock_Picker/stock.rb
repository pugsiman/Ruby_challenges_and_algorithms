def stock_picker(prices_array)
  best_buy = 0
  best_value = 0
  best_sell = 0

  # double iterations to compare between indices and values per character.
  prices_array.each_with_index do |buy, idxBuy|
    prices_array.each_with_index do |sell, idxSell|
      # buying has to be before selling
      if idxBuy < idxSell
        # iterating to see what combination will result in the best value
        temp_value = sell - buy
        if temp_value > best_value
          best_value = temp_value
          best_buy = idxBuy
          best_sell = idxSell
        end
      end
    end
  end
  [best_buy, best_sell]
end

print stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
