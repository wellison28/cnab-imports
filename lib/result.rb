# frozen_string_literal: true

class Result
  attr_accessor :valid, :error_message, :data_result

  def initialize(valid:, error_message: '', data_result: [])
    @valid = valid
    @error_message = error_message
    @data_result = data_result
  end

  def valid?
    valid
  end

  def error
    error_message
  end

  def data
    data_result
  end
end
