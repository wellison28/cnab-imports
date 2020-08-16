# frozen_string_literal: true

class ImportCreateService
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def self.perform(*args)
    new(*args).create_transaction
  end

  def create_transaction
    return object_parsed unless object_parsed.valid?

    Transaction.insert_all(transaction_params)

    Result.new(valid: true)
  rescue OperationError => e
    Result.new(valid: false, error_message: e.message)
  end

  private

  def object_parsed
    @object_parsed ||= Parse::Cnab.new(file).parse
  end

  def transaction_params
    object_parsed.data.map do |data|
      build_object(data)
    end
  end

  def build_object(data)
    {
      date: data[:date],
      amount: data[:amount],
      card: data[:card],
      hour: data[:hour],
      recipient_id: recipient(data).id,
      store_id: store(data).id,
      transaction_type_id: transaction_type(data).id
    }
  end

  def recipient_params(data)
    {
      cpf: data[:cpf]
    }
  end

  def store_params(data)
    {
      name: data[:store_name],
      owner_name: data[:store_owner_name]
    }
  end

  def recipient(data)
    Recipient.find_or_create_by(recipient_params(data))
  end

  def store(data)
    Store.find_or_create_by(store_params(data))
  end

  def transaction_type(data)
    TransactionType.find_by!(kind: data[:kind])
  rescue StandardError
    raise OperationError, 'operation does not exists'
  end

  class OperationError < StandardError; end
end
