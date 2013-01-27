class Category < ActiveRecord::Base
  attr_accessible :name, :description
  validates :name, :presence => true, :length => { :minimum => 4, :maximum => 100 }
  validates :description, :presence => true, :length => { :minimum => 20, :maximum => 1000 }
  validates_uniqueness_of :name
  has_many :posts
end
