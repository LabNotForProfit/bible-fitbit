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

User.create({username: 'Test1', email: 'test1@test.com', password: 'asdfasdf'})
User.create({username: 'Test2', email: 'test2@test.com', password: 'asdfasdf'})
User.create({username: 'Test3', email: 'test3@test.com', password: 'asdfasdf'})
User.create({username: 'Test4', email: 'test4@test.com', password: 'asdfasdf'})
User.create({username: 'Test5', email: 'test5@test.com', password: 'asdfasdf'})

#create Book objects
for i in 0..65
	Book.create({name: @books[i], key_verse: @key_verses[i], abbr: @book_abbr[i]})
end
