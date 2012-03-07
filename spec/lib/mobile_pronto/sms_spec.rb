require_relative '../../spec_helper'

describe MobilePronto::SMS do
 
  describe "default attributes" do
 
    it "must include httparty methods" do
      MobilePronto::SMS.must_include HTTParty
    end
 
    it "must have the base url set to the API endpoint" do
      MobilePronto::SMS.base_uri.must_equal 'http://www.mpgateway.com/v_2_00'
    end
  end

  describe "GET credits" do
 
    let(:mp) { MobilePronto::SMS.new('YOURAPICREDENTIALHERE') }
   
    before do
      VCR.insert_cassette 'sms', :record => :credits
    end
   
    after do
      VCR.eject_cassette
    end
   
    it "must have a credits method" do
      mp.must_respond_to :credits
    end
   
    it "must perform the request and get the data" do
      mp.credits.must_equal '0.00'
    end
  end

  describe "GET send" do
 
    let(:mp) { MobilePronto::SMS.new('YOURAPICREDENTIALHERE') }
   
    before do
      VCR.insert_cassette 'sms', :record => :send
    end
   
    after do
      VCR.eject_cassette
    end
   
    it "must have a send method" do
      mp.must_respond_to :send
    end
   
    it "must perform the request and get the data" do
      mp.send.must_equal '000'
    end
  end

  describe "GET follow" do
 
    let(:mp) { MobilePronto::SMS.new('YOURAPICREDENTIALHERE') }
   
    before do
      VCR.insert_cassette 'sms', :record => :follow
    end
   
    after do
      VCR.eject_cassette
    end
   
    it "must have a follow method" do
      mp.must_respond_to :follow
    end
   
    it "must perform the request and get the data" do
      mp.follow.must_equal '000'
    end
  end

  describe "GET status" do
 
    let(:mp) { MobilePronto::SMS.new('YOURAPICREDENTIALHERE') }
   
    before do
      VCR.insert_cassette 'sms', :record => :status
    end
   
    after do
      VCR.eject_cassette
    end
   
    it "must have a status method" do
      mp.must_respond_to :status
    end
   
    it "must perform the request and get the data" do
      mp.status.must_equal '200'
    end
  end

  describe "GET query01" do
 
    let(:mp) { MobilePronto::SMS.new('YOURAPICREDENTIALHERE') }
   
    before do
      VCR.insert_cassette 'sms', :record => :query01
    end
   
    after do
      VCR.eject_cassette
    end
   
    it "must have a status method" do
      mp.must_respond_to :query01
    end
   
    it "must perform the request and get the data" do
      mp.query01.must_equal '200'
    end
  end
 
end
