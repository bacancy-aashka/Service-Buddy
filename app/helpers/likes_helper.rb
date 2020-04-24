module LikesHelper
  def like_present?(user, comment)
    if Like.find_by(comment_id: comment, user_id: user) != nil
      true
    else
      false
    end
  end
end
