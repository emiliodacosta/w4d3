# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  after_initialize :ensure_session_token_existence

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  def generate_session_token

  end

  def reset_session_token!
    SecureRandom:
  end

  def ensure_session_token_existence
    #if token doesn't already exist create one
    self.session_token ||=
  end

end
