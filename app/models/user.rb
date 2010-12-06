class User < ActiveRecord::Base
  validates :email, :uniqueness => true, :length => 6..250, :format => /^([^@\s]+)@((?:[^@\s_]+\.)+[a-z]{2,})$/i
  validates :password, :length => 4..250
  validates :name, :presence => true

  def privileged?
    card.present? or admin?
  end

  def admin?
    status == 'admin'
  end
end
