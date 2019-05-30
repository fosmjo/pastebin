module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      # set confirmed_at manully, so it won't send confirmation email
      user = FactoryBot.create(:user, confirmed_at: Time.now)
      sign_in user
    end
  end
end