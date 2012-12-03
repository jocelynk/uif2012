class User < ActiveRecord::Base  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_save :ensure_authentication_token
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :role, :first_name, :last_name, :active, :department_id
attr_accessor :login
  has_many :notes
  
  #nifty generated  
  # Use built-in rails support for password protection
  #has_secure_password
  
  # Specify fields that can be accessible through mass assignment (not password_digest)
  #attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :active, :role, :department_id
  
  # Relationships
  # -----------------------------
  belongs_to :department
  

  # Scopes
  # -----------------------------
  scope :alphabetical,   order("last_name, first_name")
  scope :active,         where('active = ?', true)
  scope :inactive,       where('active = ?', false)
  scope :admins,         where('role = ?', "admin")
  scope :for_department, lambda { |department_id| where("department_id = ?", department_id) }
  scope :for_name,       lambda { |name| where("first_name LIKE ? or last_name LIKE ?", name + "%", name + "%") }
    
  # Validations
  # -----------------------------
  # make sure required fields are present
  #validates_presence_of :first_name, :last_name, :username 
  validates_uniqueness_of :username
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net))$/i, :message => "is not a valid format", :allow_blank => true
  #validates_presence_of :password, :on => :create 
  #validates_presence_of :password_confirmation, :on => :create 
  #validates_confirmation_of :password, :message => "does not match"
 # validates_length_of :password, :minimum => 6, :message => "must be at least 6 characters long", :allow_blank => true
  #validates_inclusion_of :active, :in => [true, false], :message => "must be either true or false"
  #validates_inclusion_of :role, :in => %w( admin checkin ), :message => "is not recognized in the system"
  
  # Callbacks
  # -----------------------------
  # if we get to this point we'll uncomment it
  # after_create :send_welcome_email
  
  
  # Other methods
  # -----------------------------  
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  # for use in authorizing with CanCan
  ROLES = [['Administrator', :admin],['Check-in Person', :checkin]]

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  def is_admin?
    return false unless role == "admin"
    true
  end
  
   def self.find_first_by_auth_conditions(warden_conditions)
     puts "asdf"
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
  
=begin
  # login by username address
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
  
  private
  # assuming we get to this point...
  def send_welcome_email
    new_user = self
    pswd = self.password
    PostOffice.new_user_msg(new_user, pswd).deliver
  end
=end

end
