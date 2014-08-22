class User < Neo4j::Rails::Model
  property :name, :type => String, :index => :exact
  property :mood, :type => String
  property :status, :type => String
  property :dob, :type => DateTime, :index => :exact
  property :uid, :type => String, :index => :exact
  property :username, :type => String
  property :email, :type => String, :index => :exact
  property :gender, :type => String, :index => :exact
  property :remember_token, :type => String, :index => :exact

  before_save :create_remember_token

  def self.create_with_omniauth(auth)
    puts auth.to_s
    create! do |user|
      user_details = auth['extra']['raw_info']
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.username = auth['info']['nickname']
      user.email = user_details['email']
      user.gender = user_details['gender']
      user.dob = DateTime.parse(user_details['birthday'])
      user.remember_token = SecureRandom.urlsafe_base64
    end

    #UserMailer.welcome_email(user).deliver

  end


 private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end

end
