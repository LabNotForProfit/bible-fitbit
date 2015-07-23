module ApplicationHelper

	def title(page_title)
  		content_for(:title) { page_title }
	end

	def numeric?(string)
		Integer(string) != nil rescue false
	end
end
