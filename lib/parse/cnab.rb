# frozen_string_literal: true

module Parse
  class Cnab
    attr_accessor :file

    def initialize(file)
      @file = file
    end

    def parse
      Result.new(valid: true, data_result: iteration_on_file)
    rescue InvalidFormat => e
      Result.new(valid: false, error_message: e.message)
    end

    private

    def iteration_on_file
      result = []

      IO.foreach(file) do |line|
        raise InvalidFormat, 'invalid format' if line.size < 80

        result << build_object(Parse::ParseLine.new(line))
      end

      result
    end

    def build_object(result_line)
      {
        kind: result_line.kind,
        date: result_line.date,
        amount: result_line.amount,
        cpf: result_line.cpf,
        card: result_line.card,
        hour: result_line.hour,
        store_owner_name: result_line.store_owner_name,
        store_name: result_line.store_name
      }
    end

    class InvalidFormat < StandardError; end
  end
end
