# frozen_string_literal: true

require 'rails_helper'

describe Parse::ParseLine do
  subject(:parsed_line) { described_class.new(line) }

  let(:line) { '128101992000000100040255489846676387263562132334          john          start big' }

  it { expect(parsed_line.date).to eq('1992-10-28') }
  it { expect(parsed_line.amount).to eq(1000.0) }
  it { expect(parsed_line.cpf).to eq('40255489846') }
  it { expect(parsed_line.card).to eq('676387263562') }
  it { expect(parsed_line.hour).to eq('13:23:34') }
  it { expect(parsed_line.store_owner_name).to eq('john') }
  it { expect(parsed_line.store_name).to eq('start big') }
end
