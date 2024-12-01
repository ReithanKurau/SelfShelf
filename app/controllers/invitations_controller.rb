class InvitationsController < ApplicationController
  def index
    @pendings = current_user.pending_invitations
    @friends = current_user.friends
  end

  def create
    id1 = params[:invitation][:user_id]
    id2 = params[:invitation][:friend_id]
    @invitation = Invitation.new(user_id: id2, friend_id: id1)
    if @invitation.save
      redirect_to users_path
    else
      raise #shouldnt get here
    end
  end

  def update
    invitation = Invitation.find(params[:invitation_id])
    invitation.update(confirmed: true)
    redirect_to user_path(invitation.friend_id)
  end
end
