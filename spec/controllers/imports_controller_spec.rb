# frozen_string_literal: true

require 'rails_helper'

describe ImportsController do
  describe 'GET /new' do
    before { get :new }

    it { is_expected.to render_template(:new) }
  end

  describe 'POST /create' do
    before do
      allow(ImportCreateService).to receive(:perform).and_return(result)

      post :create
    end

    context 'when success' do
      let(:result) do
        OpenStruct.new(
          valid?: true
        )
      end

      it { is_expected.to redirect_to(new_import_path) }
      it { expect(flash[:notice]).to eq('Importação feita com sucesso!') }
    end

    context 'when failure' do
      let(:result) do
        OpenStruct.new(
          valid?: false,
          error: 'invalid format'
        )
      end

      it { is_expected.to redirect_to(new_import_path) }
      it { expect(flash[:notice]).to eq('invalid format') }
    end
  end
end
