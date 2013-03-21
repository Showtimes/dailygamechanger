require 'csv'

task :import_game_changers, [:csv_filename] => :environment do |task, args|

	puts 'ADDING SOME GAME CHANGERS, YO'

	filepath = "#{Rails.root}#{args[:csv_filename]}"

	changers = CSV.read(filepath)

	changers.each_with_index do |c, index|
		unless index == 0
			Changer.create(:title => c[0],
						   :url => c[1],
						   :youtube_id => c[2],
						   :start_seconds => c[3],
						   :end_seconds => c[4]
						  )

		end
	end

	puts 'DONE ADDING GAME CHANGERS'

end