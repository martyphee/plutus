require 'spec_helper'

module Plutus
  describe AccountsController do
    routes { Plutus::Engine.routes }

    let(:mock_account) {FactoryGirl.create(:asset)}

    before do
      allow(Account).to receive(:all).and_return([mock_account])
    end

    describe "GET index" do
      it "assigns all accounts as @accounts" do
        get :index
        assigns[:accounts].should == [mock_account]
      end
    end
  end
end
