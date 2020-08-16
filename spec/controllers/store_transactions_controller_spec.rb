# frozen_string_literal: true

require 'rails_helper'

describe StoreTransactionsController do
  describe 'GET /transactions' do
    before do
      create_list(:store, 3)

      get :index
    end

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:stores)).to eq(Store.all) }
  end

  describe 'GET /transactions/1' do
    let(:store) { create(:store) }

    before do
      get :show, params: { id: store.id }
    end

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:store_transactions)).to eq(store) }
  end
end
