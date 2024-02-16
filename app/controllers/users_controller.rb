class UsersController < ApplicationController
  def create
    username_input = params.fetch("username_input")

    a_new_user = User.new

    a_new_user.username = username_input

    a_new_user.save

    redirect_to("/users/#{username_input}")
  end

  def update
    # Parameters: {"edit_username_input"=>"amandaaa", "path_id"=>"121"}
    edit_username_input = params.fetch("edit_username_input")
    edited_user_id = params.fetch("path_id")

    updated_user = User.where({ :id => edited_user_id }).first
    updated_user.username = edit_username_input
    
    updated_user.save

    redirect_to("/users/#{updated_user.username}")
  end

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    # Parameters: {"path_username" => "anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    if  @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" })
    end

  end

end
