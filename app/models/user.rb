class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :pseudoname, presence: true
  validates :pseudoname, uniqueness: { message: "ce nom est deja utilisé" }, format: { with: /\A[a-zA-Z0-9]+\Z/ , message: "Ne doit pas contenir d'espace"}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :statuses
  has_many :user_friendships
  has_many :friends, through: :user_friendships

  def full_name
    firstname.capitalize + " " + lastname.capitalize
  end

  def gravatar_url
    fixed_email = email.strip.downcase
    hash = Digest::MD5.hexdigest(fixed_email)

    "http://gravatar.com/avatar/#{hash}"
  end
end
