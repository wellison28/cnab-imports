# frozen_string_literal: true

module Parse
  class Cnab
    attr_accessor :file

    def initialize(file)
      @file = file
    end

    def parse
      Result.new(valid: true, error_message: '', data_result: iteration_on_file)
    rescue InvalidFormat => e
      Result.new(valid: false, error_message: e.message, data_result: [])
    end

    private

    def iteration_on_file
      result = []

      IO.foreach(file) do |line|
        raise InvalidFormat, 'invalid format' if line.size < 80

        result << build_object(ParseLine.new(line))
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
        store_name: result_line.owner_name
      }
    end

    class Result
      attr_accessor :valid, :error_message, :data_result

      def initialize(valid:, error_message:, data_result:)
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

    class ParseLine
      attr_accessor :line

      def initialize(line)
        @line = line
      end

      def kind
        line[0].to_i
      end

      def date
        "#{line[5, 4]}-#{line[3, 2]}-#{line[1, 2]}"
      end

      def amount
        line[9, 10].to_f
      end

      def cpf
        line[19, 11]
      end

      def card
        line[30, 12]
      end

      def hour
        "#{line[42, 2]}:#{line[44, 2]}:#{line[46, 2]}"
      end

      def store_owner_name
        line[48, 14].strip
      end

      def owner_name
        line[62, 19].strip
      end
    end

    class InvalidFormat < StandardError; end
  end
end
