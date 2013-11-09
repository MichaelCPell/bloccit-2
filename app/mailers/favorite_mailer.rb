class FavoriteMailer < ActionMailer::Base
  default from: "orrett@bloccit.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment 

    headers["Message-ID"] = "<comments/#{@comment.id}@Bloccit>"
    headers["In-Reply-To"] = "<post/#{post.id}@Bloccit>"
    headers["References"] = "<post/#{@post.id}@Bloccit>"

    mail(to: user.email, subject: "New Comment on #{post.title}")

  end
end
