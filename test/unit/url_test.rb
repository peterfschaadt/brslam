require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  ### App Tests

  test 'Creating a URL lets us fetch short code' do
    # Create a new URL
    test_url = Url.create(:url => 'http://google.com')
    # URL should have a short code
    assert_present test_url.short_code
  end

  test 'All existing URLs have short codes' do
    # Create a new URL
    test_url = Url.create(:url => 'http://google.com')
    # Force fetch from database
    retrieved_url = Url.find(test_url.id)
    # URL's short code must be present
    assert_present retrieved_url.short_code
    # Submitted URL short code must match retrieved URL short code
    assert_equal test_url.short_code, retrieved_url.short_code
  end

  # test 'Converting a short code to an ID' do
  #   # add test
  # end

  test 'Finding a URL from a given short code' do
    # Create a new URL
    test_url = Url.create(:url => 'http://google.com')
    # Submitted URL must match short code of retrieved URL
    assert_equal test_url, Url.find_using_short_code!(test_url.short_code)
  end

  test 'Finding a URL from an invalid short code raises an exception' do
    # Make sure that an ActiveRecord exception is raised
    assert_raises ActiveRecord::RecordNotFound do
      Url.find_using_short_code! 'non-existent-short-code'
    end
  end
end
