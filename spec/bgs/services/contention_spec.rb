# frozen_string_literal: true

require 'bgs'

describe BGS::ContentionWebService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end
end
