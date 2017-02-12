require 'rails_helper'

RSpec.describe Question, type: :model do
   it "has none to begin with" do
    expect(Question.count).to eq 0
  end

  it "has one after adding one" do
  	@user = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
    Question.create(:content => "5 plus 5 is?", :answer => "10", :user_id => @user.id )
    expect(Question.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Question.count).to eq 0
  end
end
