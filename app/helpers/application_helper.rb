module ApplicationHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=32"
    image_tag(gravatar_url, :class => 'gravatar')
  end
end
