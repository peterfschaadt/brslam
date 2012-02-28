class Url < ActiveRecord::Base
  validates :url, :presence => true

  # Create a short code string
  def short_code
    id.to_s 36
  end

  # Take number from base 36 value to get ID
  def self.find_using_short_code!(short_code)
    find short_code.to_i(36)
  end
end
