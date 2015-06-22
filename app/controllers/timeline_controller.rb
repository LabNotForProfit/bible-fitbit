class TimelineController < ApplicationController
  
  def index
  	@user = current_user
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
  end

  def edit
  	@user = current_user
  	@all_books = Book.all
  	@genesis = {:name => "Genesis", :class => "brick size21", :position => "0-0"}
  	@exodus = {:name => "Exodus", :class => "brick size12", :position => "0-2"}
    @leviticus = {:name => "Leviticus", :class => "brick size11", :position => "0-3"}
  	@numbers = {:name => "Numbers", :class => "brick size11", :position => "1-3"}
  	@deuteronomy = {:name => "Deuteronomy", :class => "brick size22", :position => "0-4"}
  	@joshua = {:name => "Joshua", :class => "brick size22", :position => "0-6"}
  	@judges = {:name => "Judges", :class => "brick size22", :position => "1-0"}

  	@book_list = [@genesis, @exodus, @leviticus, @numbers, @deuteronomy, @joshua, @judges]
  end

end
