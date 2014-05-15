require 'spec_helper'

describe User do
  it 'should require all attributes' do
    @user = { u_id: '', nickname: '', name: '', profile_image: '', url: '',
              auth_token: '', auth_secret: '' }
    User.new(@user).should_not be_valid
  end

  it 'should be valid' do
    @user = { u_id: '122324', nickname: 'acd', name: 'asd df',
              profile_image: 'image.jpg', url: '/twitter/acd',
              auth_token: 'tqweyrw273682', auth_secret: 'DFVD2387cmxn' }
    User.new(@user).should be_valid
  end
end
