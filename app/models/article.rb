class Article < ActiveRecord::Base
	self.table_name = "refGoods"
	belongs_to :expense_type, foreign_key: 'expense_id'
end