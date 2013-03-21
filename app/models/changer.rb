class Changer < ActiveRecord::Base
  attr_accessible :disabled, :last_used_at, :rank, :url, :user_id, :youtube_id, :start_seconds, :end_seconds, :title

  scope :virgins, where("last_used_at IS NULL")
  scope :sluts, where("last_used_at IS NOT NULL")

  def make_url
  	"http://www.youtube.com/v/#{self.youtube_id}?start=#{self.start_seconds}&end=#{self.end_seconds}&version=3"
  end

  def self.select_game_changer 
  	if self.virgins.present?
  		self.virgins.sample
  	else
  		self.where('last_used_at < ?', 1.month.ago).order('last_used_at ASC').sample
  	end
  end

  def mark_used
  	self.update_attribute(:last_used_at, Time.now)
  end

end
