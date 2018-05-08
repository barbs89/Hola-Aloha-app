require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :user => nil,
        :language_from => nil,
        :language_to => nil,
        :subject => "Subject",
        :description => "MyText",
        :price => "9.99",
        :stripe_charge_id => "Stripe Charge"
      ),
      Job.create!(
        :user => nil,
        :language_from => nil,
        :language_to => nil,
        :subject => "Subject",
        :description => "MyText",
        :price => "9.99",
        :stripe_charge_id => "Stripe Charge"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Charge".to_s, :count => 2
  end
end
