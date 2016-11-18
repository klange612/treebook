module StatusesHelper
  def gravatar_url(user)
    "https://s.gravatar.com/avatar/" + Digest::MD5.hexdigest(user.email.strip.downcase)
  end
end
