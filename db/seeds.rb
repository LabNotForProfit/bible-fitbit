# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@books = ['Genesis', 'Exodus', 'Leviticus', 'Numbers','Deuteronomy', 'Joshua',
			 'Judges', 'Ruth', '1 Samuel', '2 Samuel', '1 Kings', '2 Kings', '1 Chronicles',
			 '2 Chronicles', 'Ezra', 'Nehemiah', 'Esther', 'Job', 'Psalms', 'Proverbs',
			 'Ecclesiastes', 'Song of Songs', 'Isaiah', 'Jeremiah', 'Lamentations', 'Ezekiel',
			 'Daniel', 'Hosea', 'Joel', 'Amos', 'Obadiah', 'Jonah', 'Micah', 'Nahum', 'Habakkuk',
			 'Zephaniah', 'Haggai', 'Zechariah', 'Malachi', 'Matthew', 'Mark', 'Luke', 'John',
			 'Acts', 'Romans', '1 Corinthians', '2 Corinthians', 'Galatians', 'Ephesians', 
			 'Philippians', 'Colossians', '1 Thessalonians', '2 Thessalonians', '1 Timothy',
			 '2 Timothy', 'Titus', 'Philemon', 'Hebrews', 'James', '1 Peter', '2 Peter', '1 John',
			 '2 John', '3 John', 'Jude', 'Revelation']
#http://www.treasureinthebible.com/MemoryVerses66.html
@key_verses=["1.1","14.14","20.26","23.19","7.9","1.8","3.9","1.17","16.7","7.22","8.39",
			"22.19","29.17","15.2","7.10","9.5","4.14","19.25","68.19","3.5-6","5.7","2.4","40.11",
			"29.11","2.19","36.26","4.34","14.8","2.32","5.6","1.21","2.8","7.8","1.7","3.19",
			"3.17","1.5","4.6","4.2","5.44","6.50","1.37","15.5","17.26","3.23","10.13","12.9",
			"5.22-23","2.10","4.19","3.23","5.11","3.13","1.15","3.16","3.4-5","1.25","10.25",
			"4.10","3.15","1.2","1.9","1.6","1.11","1.22","21.6"]

@book_abbr = ["Gen", "Exod", "Lev", "Num", "Deut", "Josh", "Judg", "Ruth", "1Sam", "2Sam",
 			"1Kgs", "2Kgs", "1Chr", "2Chr", "Ezra", "Neh", "Esth", "Job", "Ps", "Prov", "Eccl",
			"Song", "Isa", "Jer ", "Lam", "Ezek", "Dan", "Hos", "Joel", "Amos", "Obad", "Jonah", "Mic", "Nah",
 			"Hab", "Zeph", "Hag", "Zech", "Mal", "Matt", "Mark", "Luke", "John", "Acts", "Rom", "1Cor", "2Cor",
			"Gal", "Eph", "Phil", "Col", "1Thess", "2Thess", "1Tim", "2Tim", "Titus", "Phlm", "Heb",
 			"Jas", "1Pet", "2Pet", "1John", "2John", "3John", "Jude", "Rev"]

@book_order_nums = [2, 7, 13, 12, 100, 14, 15, 44, 21, 21, 30, 30, 43, 43, 31, 32, 33, 51, 39, 100, 34, 51, 35, 36, 
										37, 38, 40, 41, 50, 42, 50, 45, 46, 50, 47, 50, 50, 48, 49, 11, 1, 10, 9, 8, 3, 4, 6, 18, 16,
										17, 19, 26, 26, 24, 5, 25, 28, 20, 23, 27, 27, 22, 28, 28, 28, 29]

(1..20).each do |i|
	User.create({firstname: "Test#{i}", lastname: "User", username: "test#{i}", email: "test#{i}@test.com", password: "asdfasdf"})
end

# Make some friendships
(2..15).each do |i|
	User.find(1).friends << User.find(i)
end
User.find(2).friends << User.find(4)
User.find(3).friends << User.find(5)

#create Book objects
(0..65).each do |i|
	Book.create({name: @books[i], key_verse: @key_verses[i], abbr: @book_abbr[i], order_num: @book_order_nums[i]})
end

@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
@passages = @biblesearch.passages(('Gen 1:1, 12:1-3, 15:5-6, 3:17-19, 50:20, 1:27-28, 2:23-25, 4:9, 6:3, 7:10, 8:13, 11:3-4, 13:8-9, 14:19-20, 16:6, 17:5, 17:17, 18:13-15, 19:17, 19:26, 20:17, 21:6, 21:16, 22:14, 23:6, 24:56, 25:23, 25:34, 27:33, 28:12, 29:15-16, 30:2, 30:35-36, 31:14-16, 32:3, 32:26, 33:4, 34:9-10, 35:6-7, 37:9, 37:21, 38:26, 39:8-9, 41:16, 42:24, 43:9, 44:12, 44:32-33, 45:7, 48:14'), :version => "eng-ESV")
@passages.collection.each do |passage|
	@question = Question.create({book_id: 1, reference: passage['display'], verse: passage.text, questionType: "Pick Chapter"})
end
@passages = @biblesearch.passages(('Rom 3:1-2, 7:8, 1:14, 9:3, 12:9-11, 14:3, 16:25-27, 1:16, 4:2-3, 10:9, 6:23, 8:31-32, 13:1, 1:18, 9:20, 13:8, 15:20, 3:23-24, 14:20-21, 12:4-5, 2:4, 4:17-18, 5:3-5, 8:1, 3:10-12, 7:24, 1:24-25, 5:1-2, 10:14-15, 8:16-17, 11:17-18, 6:1-2, 6:12-13, 15:1-2, 3:20, 2:28-29, 16:3-4, 14:7-8, 6:7, 5:6-8'), :version => "eng-ESV")
@passages.collection.each do |passage|
	@question = Question.create({book_id: 45, reference: passage['display'], verse: passage.text, questionType: "Pick Chapter"})
end
@passages = @biblesearch.passages(('1Cor 9:22, 10:31, 6:12, 1:26, 8:9, 15:19, 14:20, 2:2, 3:1-2, 15:58, 3:16, 12:18, 4:15, 12:26, 5:12, 13:4, 3:6-7, 1:18, 11:3, 6:19-20, 4:20, 8:1, 1:31, 14:19, 4:7, 9:27, 10:13, 1:12, 11:1, 14:12, 12:4-5, 9:19, 15:1-2, 6:11, 13:12, 3:10, 15:3, 1:27, 7:29-31, 6:18'), :version => "eng-ESV")
@passages.collection.each do |passage|
	@question = Question.create({book_id: 46, reference: passage['display'], verse: passage.text, questionType: "Pick Chapter"})
end
@passages = @biblesearch.passages(('2Tim 1:6, 1:7, 1:13-14, 1:15, 1:16-18, 2:1-2, 2:3-4, 2:5-6, 2:8-9, 2:11-13, 2:15, 2:16-18, 2:19, 2:20-21, 2:22, 2:23, 2:24-26, 3:1, 3:2-5, 3:7, 3:8-9, 3:10-11, 3:12-13, 3:14-15, 3:16-17, 4:2, 4:3-4, 4:5, 4:6-8, 4:16-18'), :version => "eng-ESV")
@passages.collection.each do |passage|
	@question = Question.create({book_id: 55, reference: passage['display'], verse: passage.text, questionType: "Pick Chapter"})
end
@passages = @biblesearch.passages(('2Cor 1:3-4, 1:8-9, 1:12, 1:21-22, 2:5-8, 2:10-11, 2:12-13, 2:14-16, 3:2-3, 3:5-6, 3:17, 4:1, 4:8-10, 4:16-18, 5:1, 5:7, 5:9-10, 5:11, 5:14-15, 5:17, 5:18-19, 5:20-21, 6:4-8, 6:9-10, 6:14-15, 7:1, 7:10, 8:1-3, 8:9, 8:13-15, 8:21, 9:6, 9:7, 9:9-10, 10:3-4, 10:5-6, 10:10-11, 10:12, 10:17-18, 11:1-3, 11:13-15, 11:23-27, 11:30, 12:9, 12:10, 12:14-15, 13:1-2, 13:3-4, 13:9-10, 13:11'), :version => "eng-ESV")
@passages.collection.each do |passage|
	@question = Question.create({book_id: 47, reference: passage['display'], verse: passage.text, questionType: "Pick Chapter"})
end

# Add sample quiz scores
User.all.each do |user|
	rand_num = rand(20)+20
	rand_num.times do
		num_questions = rand(31)+10
		QuizScore.create({user: user, book: Book.all.order(:order_num)[rand(4)+1], num_questions: num_questions, num_correct: num_questions-rand(11)})
	end
end