class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  devise :omniauthable, :omniauth_providers => [:facebook]

  field :avatar_uid
  image_accessor :avatar

  ## Database authenticatable
  field :first_name,         :type => String
  field :last_name,          :type => String
  field :role, type: String
  field :email,              :type => String
  field :encrypted_password, :type => String
  field :fb_access_token,    :type => String
  field :provider, type: String
  field :uid, type: String
  field :name, type: String

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  has_many :comments
  has_many :orders

  def admin?
    self.role == 'admin'
  end

  def fullname
    [first_name, last_name].join(' ')
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(first_name: auth.info.first_name,
                          last_name: auth.info.last_name,
                          provider:auth.provider,
                          uid:auth.uid,
                          email:auth.info.email,
                          role:'customer',
                          password:Devise.friendly_token[0,20]
                          )
      user.avatar_url = auth.info.image
      user.save!
    end
    user
  end

end
