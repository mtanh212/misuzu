require 'rails_helper'

RSpec.describe "kairans/show", type: :view do
  before(:each) do
    @kairan = assign(:kairan, Kairan.create!(
      :hakkousha => "Hakkousha",
      :namelist => "Namelist"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hakkousha/)
    expect(rendered).to match(/Namelist/)
  end
end
