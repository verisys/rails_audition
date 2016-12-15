require "test_helper"

describe PagesController do
  it "should get show" do
    get pages_show_url
    value(response).must_be :success?
  end

end
