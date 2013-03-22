class Peon < ActiveRecord::Base
  obfuscate_id :spin => 76498726

  attr_accessible :email, :ip_at_signup, :name, :tracking_code, :unsubscribe_token, :unsubscribed_at

  after_create :welcome_peon

  # validate email format and general form validations
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
               
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

  scope :active, where('unsubscribed_at IS NULL')


  def welcome_peon
  	PeonMailer.welcome(self).deliver
  end

  def unsubscribe
    self.update_attribute(:unsubscribed_at, Time.now)
  end

  def resubscribe
    self.update_attribute(:unsubscribed_at, nil)
  end

  def unsub_url
    "http://www.dailygamechanger.com/peons/#{self.to_param}/unsubscribe?grendel=#{self.unsubscribe_token}"
  end

  def subscribed?
    !self.unsubscribed_at.present?
  end

end
