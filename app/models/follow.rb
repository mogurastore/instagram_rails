class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'

  validates :target_user_id, uniqueness: { scope: :user_id }
end
