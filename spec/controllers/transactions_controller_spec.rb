# frozen_string_literal: true

require 'rails_helper'

describe TransactionsController do
  describe 'GET /transactions' do
    before do
      create_list(:store, 3)

      get :index
    end

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:stores)).to eq(Store.all) }
  end
end
