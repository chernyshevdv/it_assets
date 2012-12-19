class ExpenseType < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'refExpenseTypes'

  def annotated_title
  	"<abbr title='#{id}'>#{title}</abbr>".html_safe
  end
end
