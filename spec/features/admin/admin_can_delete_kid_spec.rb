require "rails_helper"

describe "As an admin" do
  describe "from the kids show page"
  it "should delete kid" do
    admin = create(:admin)
    name = "Elijah"
    kid = admin.kids.create(name: name)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_kid_path(kid)

    click_on("Delete")

    expect(current_path).to eq(kids_path)
    expect(page).to have_content("#{name} was successfully deleted.")
    within(".kids") do
      expect(page).to_not have_content(name)
    end
  end
end
