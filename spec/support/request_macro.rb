require 'fakeweb'
module RequestMacro
  def current_user
    visit '/'
    click_link 'Sign In With Twitter'
    expect do
      FakeWeb.register_uri(:get,
                           'http://127.0.0.1:3000/auth/twitter',
                           status: '200')
    end
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.u_id
    @current_user = User.where(u_id: session[:user_id]).first
  end
end
