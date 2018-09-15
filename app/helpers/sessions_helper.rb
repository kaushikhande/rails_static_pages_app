module SessionsHelper
  def log_in(user)
    sessions[:user_id] = user.id
  end

  def current_user
    if sessions[:user_id]
      @current_user ||= User.find_by(id: sessions[:user_id])
    end

  end
end
