class Importance < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'refImportance'

  def annotated_title
  	"#{id}.&nbsp;#{title}".html_safe
  end
end
