# frozen_string_literal: true

class StoreTransactionsController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
  end
end
