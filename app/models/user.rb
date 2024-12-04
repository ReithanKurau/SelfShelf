class User < ApplicationRecord
  has_many :shelf_interests
  has_many :interests, through: :shelf_interests

  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

  has_one_attached :photo
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #params to be added

  acts_as_taggable_on :tags

  STYLE = ["Cute", "Classic"]
  USER_TAGS = {Books: ["fiction", "non-fiction", "horror", "fantasy", "mystery", "romance", "young adult"],
              Movies: ["comedy", "horror", "action", "sci-fi", "animation", "family"]}

  def friends
    friends_i_sent_invitations = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitations = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitations + friends_i_got_invitations
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

end
