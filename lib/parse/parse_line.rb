# frozen_string_literal: true

module Parse
  class ParseLine
    attr_accessor :line

    def initialize(line)
      @line = line
    end

    def kind
      line[0].to_i
    end

    def date
      "#{line[1, 4]}-#{line[5, 2]}-#{line[7, 2]}"
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

    def store_name
      line[62, 19].strip
    end
  end
end
