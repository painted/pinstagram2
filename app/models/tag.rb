class Tag < ActiveRecord::Base
	validates :name, :uniqueness
	has_and_belongs_to_many :posts
end
