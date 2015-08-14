namespace :seed do
	desc "Reset Quiz Questions in the database in case something goes wrong"
	task :reset_questions => :environment do
		# Note this just deletes all records and recreates them, so id's WILL get incremented
		# The table isn't technically 'reset'
		Question.delete_all
		@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
		# Genesis
		@passages = @biblesearch.passages(('Gen 1:1, 12:1-3, 15:5-6, 3:17-19, 50:20, 1:27-28, 2:23-25, 4:9, 6:3, 7:10, 8:13, 11:3-4, 13:8-9, 14:19-20, 16:6, 17:5, 17:17, 18:13-15, 19:17, 19:26, 20:17, 21:6, 21:16, 22:14, 23:6, 24:56, 25:23, 25:34, 27:33, 28:12, 29:15-16, 30:2, 30:35-36, 31:14-16, 32:3, 32:26, 33:4, 34:9-10, 35:6-7, 37:9, 37:21, 38:26, 39:8-9, 41:16, 42:24, 43:9, 44:12, 44:32-33, 45:7, 48:14'), :version => "eng-ESV")
		@passages.collection.each do |passage|
			Question.find_or_create_by({book_id: 1, reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"})
		end

		# Romans ##################################
		@passages = @biblesearch.passages(('Rom 3:1-2, 7:8, 1:14, 9:3, 12:9-11, 14:3, 16:25-27, 1:16, 4:2-3, 10:9, 6:23, 8:31-32, 13:1, 1:18, 9:20, 13:8, 15:20, 3:23-24, 14:20-21, 12:4-5, 2:4, 4:17-18, 5:3-5, 8:1, 3:10-12, 7:24, 1:24-25, 5:1-2, 10:14-15, 8:16-17, 11:17-18, 6:1-2, 6:12-13, 15:1-2, 3:20, 2:28-29, 16:3-4, 14:7-8, 6:7, 5:6-8'), :version => "eng-ESV")
		@passages.collection.each do |passage|
			Question.find_or_create_by({book_id: 45, reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"})
		end

		# Not sure the best way to add fill in the blank questions
		@fill = @biblesearch.passages('Rom 1:18', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "unrighteousness", questionType: "Fill In Blank"})
		@fill = @biblesearch.passages('Rom 1:21', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "honor", questionType: "Fill In Blank"})
		@fill = @biblesearch.passages('Rom 2:1', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "judge", questionType: "Fill In Blank"})
		@fill = @biblesearch.passages('Rom 2:9-11', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "partiality", questionType: "Fill In Blank"})
		@fill = @biblesearch.passages('Rom 3:1-2', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "advantage", questionType: "Fill In Blank"})
		@fill = @biblesearch.passages('Rom 3:20', :version => "eng-ESV").collection.first
		Question.find_or_create_by({book_id: 45, reference: @fill['display'], verse: @fill.text, answer: "law", questionType: "Fill In Blank"})
		###########################################

		# 1 Corinthians
		@passages = @biblesearch.passages(('1Cor 9:22, 10:31, 6:12, 1:26, 8:9, 15:19, 14:20, 2:2, 3:1-2, 15:58, 3:16, 12:18, 4:15, 12:26, 5:12, 13:4, 3:6-7, 1:18, 11:3, 6:19-20, 4:20, 8:1, 1:31, 14:19, 4:7, 9:27, 10:13, 1:12, 11:1, 14:12, 12:4-5, 9:19, 15:1-2, 6:11, 13:12, 3:10, 15:3, 1:27, 7:29-31, 6:18'), :version => "eng-ESV")
		@passages.collection.each do |passage|
			Question.find_or_create_by({book_id: 46, reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"})
		end

		# 2 Timothy
		@passages = @biblesearch.passages(('2Tim 1:6, 1:7, 1:13-14, 1:15, 1:16-18, 2:1-2, 2:3-4, 2:5-6, 2:8-9, 2:11-13, 2:15, 2:16-18, 2:19, 2:20-21, 2:22, 2:23, 2:24-26, 3:1, 3:2-5, 3:7, 3:8-9, 3:10-11, 3:12-13, 3:14-15, 3:16-17, 4:2, 4:3-4, 4:5, 4:6-8, 4:16-18'), :version => "eng-ESV")
		@passages.collection.each do |passage|
			Question.find_or_create_by({book_id: 55, reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"})
		end

		# 2 Corinthians
		@passages = @biblesearch.passages(('2Cor 1:3-4, 1:8-9, 1:12, 1:21-22, 2:5-8, 2:10-11, 2:12-13, 2:14-16, 3:2-3, 3:5-6, 3:17, 4:1, 4:8-10, 4:16-18, 5:1, 5:7, 5:9-10, 5:11, 5:14-15, 5:17, 5:18-19, 5:20-21, 6:4-8, 6:9-10, 6:14-15, 7:1, 7:10, 8:1-3, 8:9, 8:13-15, 8:21, 9:6, 9:7, 9:9-10, 10:3-4, 10:5-6, 10:10-11, 10:12, 10:17-18, 11:1-3, 11:13-15, 11:23-27, 11:30, 12:9, 12:10, 12:14-15, 13:1-2, 13:3-4, 13:9-10, 13:11'), :version => "eng-ESV")
		@passages.collection.each do |passage|
			@question = Question.find_or_create_by({book_id: 47, reference: passage['display'], verse: passage.text, answer: passage['display'].split(':').first.split(' ').last, questionType: "Pick Chapter"})
		end
	end
end