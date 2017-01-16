class User < ActiveRecord::Base
  has_many :skills, :foreign_key => :owner_id
  has_many :child_skill_categories, :foreign_key => :owner_id
  has_many :parent_skill_categories, :foreign_key => :owner_id
  has_many :user_skill_scores
  has_many :skills, :through => :user_skill_scores

  validates :name, uniqueness: true
  validates :mail_address, uniqueness: true

  attr_accessor :password_confirmation

  def password
    @password
  end

  def password=(pwd)
    return if pwd.blank?
    @password = pwd
    salt_str = self.object_id.to_s + rand.to_s
    self.salt = salt_str
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(mail_address, password)
    users = self.where('mail_address = ?', mail_address)
    user = nil
    users.each do |user_temp|
      user = user_temp if user_temp.mail_address == mail_address
    end
    if user == nil
      users = self.where('mail_address = ?', mail_address)
      users.each do |user_temp|
        user = user_temp if user_temp.mail_address == mail_address
      end
    end

    return nil if user.blank?
    expected_password = encrypted_password(password, user.salt)
    return nil if user.hashed_password != expected_password
    return user
  end

  private
    def self.encrypted_password(password, salt)
      string_to_hash = password + "wibble" + salt
      Digest::SHA1.hexdigest(string_to_hash)
    end
  # /private
end
