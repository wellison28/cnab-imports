class StoreTransactionDecorator < ApplicationDecorator
  delegate_all

  def date
    object.date.strftime('%d/%m/%Y')
  end

  def hour
    object.hour.strftime('%h:%m:%s')
  end
end
