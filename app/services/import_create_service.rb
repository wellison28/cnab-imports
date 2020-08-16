class ImportCreateService
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def self.perform(*args)
    new(*args).create_transaction
  end

  def create_transaction
    return object_parsed.error unless object_parsed.valid?

    Transaction.create!(transaction_params)
  end

  private

  def object_parsed
    @object_parsed ||= Parse::Cnab.new(file).parse
  end

  def transaction_params
    {
      date: object_parsed.data[:date],
      amount: object_parsed.data[:amount],
      card: object_parsed.data[:card],
      hour: object_parsed.data[:hour],
      recipient: recipient,
      store: store,
      transaction_type: transaction_type
    }
  end

  def recipient_params
    {
      cpf: object_parsed.data[:cpf]
    }
  end

  def store_params
    {
      name: object_parsed.data[:store_name],
      owner_name: object_parsed.data[:store_owner_name]
    }
  end

  def recipient
    Recipient.find_or_create_by(recipient_params)
  end

  def store
    Store.find_or_create_by(store_params)
  end

  def transaction_type
    TransactionType.find_by(operation: object_parsed.data[:kind])
  end
end
