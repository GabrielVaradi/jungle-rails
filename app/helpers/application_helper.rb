module ApplicationHelper

  def rating(product)

  end

  def logged_in?(session)
    if session["user_id"]
      true
    else
      false
    end
  end

  def is_same_user?(session, content)
    if session["user_id"] == content.user_id
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

  def out_of_stock?(product)
    if product.quantity == 0
      true
    else
      false
    end

  end

  def is_cart_empty?(cart)
    if cart.size == 0
      true
    else
      false
    end
  end


end
