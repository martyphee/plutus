require 'spec_helper'

module Plutus
  describe EntriesController do
    routes { Plutus::Engine.routes }

    let(:mock_entry) { FactoryGirl.create(:entry_with_credit_and_debit) }

    before do
      allow(Entry).to receive(:order).and_return([mock_entry])
    end

    describe "GET index" do
      it "assigns all entries as @entries" do
        get :index
        assigns[:entries].should == [mock_entry]
      end
    end
  end
end
