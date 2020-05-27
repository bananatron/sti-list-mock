module Concerns::Expirable
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    validate :valid_expired_on
  end

  def expired_on
    return nil unless meta.dig('expirable_expires_on')
    Date.parse(meta.dig('expirable_expires_on'))
  end

  private

  def valid_expired_on
    # checks that epxired on exists and is a valid date
  end

end