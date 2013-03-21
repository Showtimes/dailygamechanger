class HomeController < ApplicationController
  def index
  	@peon = Peon.new
  end

  def success
  		
  end

  def watch
  	@changer = Changer.select_game_changer
  end

end
