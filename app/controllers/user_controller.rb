class UserController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end
  def show
    @the_user = User.where({ :username => params.fetch("username")}).at(0)
    @list_of_photos = @the_user.own_photos

    render({ :template => "users/show.html.erb" })
  end

end