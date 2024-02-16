class CommentsController < ApplicationController
  
  def create
    # Parameters: {"photo_id_input"=>"777", "author_id_input"=>"117", "comment_input"=>"Hey, yo it's anisa"}
    photo_id_input = params.fetch("photo_id_input")
    author_id_input = params.fetch("author_id_input")
    comment_input = params.fetch("comment_input")

    a_new_comment = Comment.new

    a_new_comment.photo_id = photo_id_input
    a_new_comment.author_id = author_id_input
    a_new_comment.body = comment_input

    a_new_comment.save

    redirect_to("/photos/#{photo_id_input}")
  end

end
