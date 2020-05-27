class Onboarding::PrivacyDocumentation < ListItem
  NOT_SIGNED_ERROR = "signed is required"

  def signed
    return false unless meta.dig('signed')
    ActiveModel::Type::Boolean.new.cast(meta.dig('signed'))
  end

  private

  def valid_meta
    unless meta.dig('signed').present?
      errors.add(:signed, BANK_ACCOUNT_MISSING_ERROR)
    end
  end
end