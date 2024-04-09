#encoding: utf-8
require 'spec_helper'

describe "interfaces url" do

  let(:wmc) { webmoney } # classic
  let(:wml) { contragent } # light

  it "should be exactly type" do
    wmc.should be_classic # @wm.classic? == true
    wml.should_not be_classic
  end

  it "should be prepared" do
    wmc.interfaces[:balance].class.should == URI::HTTPS
  end

  it "should prepare url to classic version" do
    # classic version
    wmc.interfaces[:balance].to_s.should == 'https://w3s.webmoney.com/asp/XMLPurses.asp'
    # non-converted
    wmc.interfaces[:get_passport].to_s.should == 'https://passport.web.money/asp/XMLGetWMPassport.asp'
    wmc.interfaces[:check_user].to_s.should == 'https://apipassport.web.money/XMLCheckUser.aspx'
  end

  it "should prepare url to x509 version" do
    # converted
    wml.interfaces[:balance].to_s.should == 'https://w3s.webmoney.com/asp/XMLPursesCert.asp'
    wml.interfaces[:check_user].to_s.should == 'https://apipassport.web.money/XMLCheckUserCert.aspx'
    # non-converted
    wml.interfaces[:transaction_get].to_s.should == 'https://merchant.web.money/conf/xml/XMLTransGet.asp'
  end

end
