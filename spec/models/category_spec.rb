require 'rails_helper'

RSpec.describe Category, type: :model do
  context "valid category" do
    let(:category) { create(:category, name: "Bikes") }
    it "is valid with valid attributes" do
      expect(category).to be_valid
    end
  end

  context "invalid category" do
    let(:category) { build(:category, name: nil) }
    it "is not valid without a name" do
      expect(category).to_not be_valid
    end
    it "is not valid with a duplicate name" do
      expect(category).to_not be_valid
    end
  end

end
