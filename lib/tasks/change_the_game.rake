task :change_the_game => :environment do

	day_num = Time.now.wday

	unless day_num == 0 || day_num == 6  # skip weekends


		game_changer = Changer.select_game_changer

		Peon.active.each do |p|

			PeonMailer.game_changer(p, game_changer).deliver

		end

		game_changer.mark_used

	end

end

