class InvitationsController < ApplicationController
  def index
    @pendings = current_user.pending_invitations
    @friends = current_user.friends
  end

  def create
    id1 = params[:invitation][:user_id]
    id2 = params[:invitation][:friend_id]
    @invitation = Invitation.new(user_id: id1, friend_id: id2)
    if @invitation.save
      redirect_to users_path
    else
      raise #shouldnt get here
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    if invitation.update(confirmed: true)
      redirect_to user_path(current_user.id)
    else
      raise #shouldnt get here
    end 
  end

  def destroy
    invitation = Invitation.find(params[:id])
    if invitation.destroy
      redirect_to user_path(current_user.id)
    else
      raise #shouldnt get here
    end
  end
end
