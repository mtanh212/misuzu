require 'rails_helper'

RSpec.describe "bashokubunmsts/index", type: :view do
  before(:each) do
    assign(:bashokubunmsts, [
      Bashokubunmst.create!(
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      Bashokubunmst.create!(
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of bashokubunmsts" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
