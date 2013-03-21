class Peon < ActiveRecord::Base
  attr_accessible :email, :ip_at_signup, :name, :tracking_code, :unsubscribe_token

  after_create :welcome_peon

  # validate email format and general form validations
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
               
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }


  def welcome_peon
  	PeonMailer.welcome(self).deliver
  end

end
