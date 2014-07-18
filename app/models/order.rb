class Order < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def number
  	date_section = created_at.strftime('%y%m%d')
  	number_section = "%04d" % id

  	date_section + number_section
  end
end
