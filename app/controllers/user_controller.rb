class UserController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    @the_user = User.where({ :username => params.fetch("username") }).at(0)
    @list_of_photos = @the_user.own_photos

    render({ :template => "users/show.html.erb" })
  end

  def feed
    @the_user = User.where({ :username => params.fetch("username") }).at(0)
    @requests_accepted = FollowRequest.where({ :sender_id => @the_user.id }).where({ :status => "accepted" })
    @ids_followed = @requests_accepted.map_relation_to_array(:recipient_id)
    @users_followed = User.where({ :id => @ids_followed })

    @list_of_photos = Photo.where({ :owner_id => @ids_followed })

    render({ :template => "users/feed.html.erb" })
  end
end
