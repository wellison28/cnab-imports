# frozen_string_literal: true

require 'rails_helper'

describe ImportsController, type: :routing do
  it { expect(get: '/imports/new').to route_to('imports#new') }
  it { expect(post: '/imports').to route_to('imports#create') }
end
