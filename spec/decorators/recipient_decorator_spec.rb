require 'rails_helper'

describe RecipientDecorator do
  subject(:recipient_decorated) { build(:recipient, cpf: '40255489846').decorate }

  it { expect(recipient_decorated.cpf).to eq('402.554.898-46') }
end
