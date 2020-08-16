# frozen_string_literal: true

class StoreTransactionsController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store_transactions = Store.find(params[:id])
    @balance = StoreBalanceQuery.call(params[:id])
  end
end
