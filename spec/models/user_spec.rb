require 'spec_helper'

describe User do
  it 'should require all attributes' do
    @user = { u_id: '', nickname: '', name: '', profile_image: '', url: '',
              auth_token: '', auth_secret: '' }
    User.new(@user).should_not be_valid
  end
end
