module SessionHelper

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
end
