# frozen_string_literal: true

require 'rails_helper'

describe Store, type: :model do
  subject(:store) { build(:store) }

  context 'with validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner_name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_length_of(:owner_name).is_at_most(50) }
  end

  context 'with associations' do
    it { is_expected.to have_many(:transactions).dependent(:restrict_with_exception) }
  end
end
