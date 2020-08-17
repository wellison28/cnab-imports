# frozen_string_literal: true

class RecipientDecorator < ApplicationDecorator
  delegate_all

  def cpf
    CPF.new(object.cpf).formatted
  end
end
