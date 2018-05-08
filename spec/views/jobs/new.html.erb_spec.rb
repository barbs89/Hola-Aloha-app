require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :user => nil,
      :language_from => nil,
      :language_to => nil,
      :subject => "MyString",
      :description => "MyText",
      :price => "9.99",
      :stripe_charge_id => "MyString"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input[name=?]", "job[user_id]"

      assert_select "input[name=?]", "job[language_from_id]"

      assert_select "input[name=?]", "job[language_to_id]"

      assert_select "input[name=?]", "job[subject]"

      assert_select "textarea[name=?]", "job[description]"

      assert_select "input[name=?]", "job[price]"

      assert_select "input[name=?]", "job[stripe_charge_id]"
    end
  end
end
