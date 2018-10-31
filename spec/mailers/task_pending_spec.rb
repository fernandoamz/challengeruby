require "rails_helper"

RSpec.describe User, type: :mailer do
  describe "Todo Mailer" do
    let(:user) { User.first }
    let(:todo_list) { TodoList.where(user_id: 1) }

    it "renders the headers" do
      expect(user.email).to eq("fernandoamz148@gmail.com")
    end
  end
end
