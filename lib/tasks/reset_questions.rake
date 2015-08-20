namespace :seed do
	desc "Reset Quiz Questions in the database in case something goes wrong"
	task :reset_questions => :environment do
		# Note this just deletes all records and recreates them, so id's WILL get incremented
		# The table isn't technically 'reset'
		Question.delete_all
		@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')

		# Pick chapter questions
		seed_file = Rails.root.join('db', 'seeds', 'pick_chapter.yml')
		config = YAML.load_stream File.read(seed_file)
		config.each do |key, value|
		puts "Adding #{key['name']} questions"
		@passages = @biblesearch.passages((key['passage']), :version => "eng-ESV")
		@passages.collection.each { |passage| Question.find_or_create_by({book_id: key['book_id'], reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"}) }
	
		seed_file = Rails.root.join('db', 'seeds', "#{key['name'].downcase}", "#{key['name'].downcase}_fill_in_blank.yml")
		config = YAML.load_stream File.read(seed_file)
		config.each do |key, value|
  		@fill = @biblesearch.passages(key['passage'], :version => "eng-ESV").collection.first
			Question.find_or_create_by({book_id: key['book_id'], reference: @fill['display'], verse: @fill.text, answer: key['answer'], questionType: "Fill In Blank"})
		end

		seed_file = Rails.root.join('db', 'seeds', "#{key['name'].downcase}", "#{key['name'].downcase}_chapter_header.yml")
		config = YAML.load_stream File.read(seed_file)
		config.each do |key, value|
  		@fill = @biblesearch.passages(key['passage'], :version => "eng-ESV").collection.first
  		html = Nokogiri::HTML(@fill.text)
			puts(html.css(".s1").text)
			Question.find_or_create_by({book_id: key['book_id'], reference: @fill['display'], verse: html.css(".s1").text, answer: key['answer'], questionType: "Chapter Header"})
		end
	end
	end
end