require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_length_of(:location).is_at_most(500) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
  end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end

  describe "association with user" do
  let(:user) { create :user }

  it "belongs to a user" do
    event = user.events.build(name: "Evening with friends")

    expect(event.user).to eq(user)
  end

  # OR, go the shoulda way:

    it { is_expected.to belong_to :user}
end

describe "association with category" do
  let(:event) { create :event }

  let(:category1) { create :category, name: "Bright", events: [event] }
  let(:category2) { create :category, name: "Clean lines", events: [event] }
  let(:category3) { create :category, name: "A Man's Touch", events: [event] }

  it "has categories" do
    expect(event.categories).to include(category1)
    expect(event.categories).to include(category2)
    expect(event.categories).to include(category3)
  end

  # Or we do it the shoulda way:
  it { is_expected.to have_and_belong_to_many :categories }
end



end








#RSpec.describe Event, type: :model do

  #describe "validations" do
    #it "is invalid without name"
    #it "is invalid without location"
    #it "is invalid with a name location than 500 characters"
    #it "is invalid without price"
    #it "is invalid without starts_at"
    #it "is invalid without ends_at"
  #end


  #it "is invalid without a name" do
      #event = Event.new(name: "")
      #event.valid?
      #expect(event.errors).to have_key(:name)
    #end


    #it "is invalid without a location" do
      #event = Event.new(location: "")
      #event.valid?
      #expect(event.errors).to have_key(:location)
    #end

    #it "is invalid with a location longer than 500 characters" do
      #event = Event.new(location: "a"*5001)
      #event.valid?
      #expect(event.errors).to have_key(:location)
    #end


    #it "is invalid without a price" do
        #event = Event.new(price: nil)
        #event.valid?
        #expect(event.errors).to have_key(:price)
      #end

      #it "is invalid without a starts_at information" do
          #event = Event.new(starts_at: nil)
          #event.valid?
          #expect(event.errors).to have_key(:starts_at)
        #end

        #it "is invalid without a ends_at information" do
            #event = Event.new(ends_at: nil)
            #event.valid?
            #expect(event.errors).to have_key(:ends_at)
          #end

#end
