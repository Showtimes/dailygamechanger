class Changer < ActiveRecord::Base
  obfuscate_id :spin => 89238723

  attr_accessible :disabled, :last_used_at, :rank, :url, :user_id, :youtube_id, :start_seconds, :end_seconds, :title

  scope :virgins, where("last_used_at IS NULL")
  scope :sluts, where("last_used_at IS NOT NULL")

  def make_url
  	"http://www.youtube.com/embed/#{self.youtube_id}?start=#{self.start_seconds}&end=#{self.end_seconds}&version=3&autoplay=1&color=white&modestbranding=1&rel=0&showinfo=0&theme=light"
  end

  def embed
  	"<iframe width='840' height='630' src='#{self.make_url}' frameborder='0' allowfullscreen></iframe>"
  end

  def self.select_game_changer(cached = true)
  	if cached
	  	Rails.cache.fetch('dgc', :expires_in => 12.hours) {
			if self.virgins.present?
		  		self.virgins.sample
		  	else
		  		self.where('last_used_at < ?', 1.month.ago).order('last_used_at ASC').sample
		  	end  		
	  	}
	else
		if self.virgins.present?
	  		self.virgins.sample
	  	else
	  		self.where('last_used_at < ?', 1.month.ago).order('last_used_at ASC').sample
	  	end
	end
  	
  end

  def mark_used
  	self.update_attribute(:last_used_at, Time.now)
  end

end
