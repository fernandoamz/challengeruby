class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
        
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  has_many :todo_lists
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.new_with_session(params, session)
    super.tap do |user|
      if(data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   
      user.image = auth.info.image 
    end
  end
end
