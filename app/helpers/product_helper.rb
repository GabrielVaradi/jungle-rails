module ProductHelper

  def out_of_stock?(product)
    if product.quantity == 0
      true
    else
      false
    end
  end

  def is_review_empty?(product)
    if product.reviews.size == 0
      true
    else
      false
    end
   end

end
