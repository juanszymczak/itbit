require 'spec_helper'

describe Itbit::Profile do

  it 'gets your profile' do
    stub_private(:get, '/private/profile', 'profile')
    Itbit::Profile.get.should == {
      usd_balance: 10000.0,
      usd_reserved: 2000.0,
      usd_available: 8000.0,
      btc_balance: 20.0,
      btc_reserved: 5.0,
      btc_available: 15.0,
      ltc_balance: 250.0,
      ltc_reserved: 100.0,
      ltc_available: 150.0,
      fee: 0.5,
      btc_deposit_address: "1XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      ltc_deposit_address: "LXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    }
  end
end
