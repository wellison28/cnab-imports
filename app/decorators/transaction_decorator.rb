class TransactionDecorator < ApplicationDecorator
  delegate_all

  decorates_association :recipient

  def date
    object.date.strftime('%d/%m/%Y')
  end

  def hour
    object.hour.strftime('%T')
  end
end
