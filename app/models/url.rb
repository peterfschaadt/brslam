class Url < ActiveRecord::Base
  validates :url, :presence => true
end
