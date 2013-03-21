class PeonMailer < ActionMailer::Base
  default :from => "zoe@dailygamechanger.com"
  
  def welcome(peon)
    @peon = peon

    mail(:to => @peon.email, :subject => "what is Daily Game Changer?")
  end

  def game_changer(peon, changer)
    @peon = peon
    @game_changer = changer
    mail(:to => @peon.email, :subject => "Your Daily Game Changer")
  end
 
end