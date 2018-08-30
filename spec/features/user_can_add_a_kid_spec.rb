require "rails_helper"

describe "Admin can add a new kid" do
  it 'can create a kid' do
    name = "Eli"

    visit kids_path

    click_on("Add a Kid")

    expect(current_path).to eq(new_kid_path)
    fill_in :kid_name, with: name
    click_on("Create Kid")

    expect(current_path).to eq(kid_path(Kid.last))
    expect(page).to have_content(name)
  end
end
