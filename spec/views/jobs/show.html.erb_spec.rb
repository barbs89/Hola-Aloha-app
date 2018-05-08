require 'rails_helper'

RSpec.describe "jobs/show", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :user => nil,
      :language_from => nil,
      :language_to => nil,
      :subject => "Subject",
      :description => "MyText",
      :price => "9.99",
      :stripe_charge_id => "Stripe Charge"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Stripe Charge/)
  end
end
