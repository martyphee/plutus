require 'spec_helper'

module Plutus
  describe ReportsController do
    routes { Plutus::Engine.routes }

    let(:mock_entry) { FactoryGirl.create(:entry_with_credit_and_debit) }

    before do
      allow(Entry).to receive(:order).and_return([mock_entry])
      get :balance_sheet
    end

    describe "GET balance_sheet" do
      context "renders when one entry exists"  do
        it { response.should be_success }
      end

      context "renders when no entries exist" do
        let(:mock_entry) { nil }
        it { response.should be_success }
      end
    end
  end
end
