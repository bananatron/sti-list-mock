class Onboarding::PayrollPaperwork < ListItem
  BANK_ACCOUNT_MISSING_ERROR = "bank account number is required"
  DOB_MISSING_ERROR = "DOB is required"
  DOB_FORMAT_ERROR = "DOB is improperly formatted"

  def bank_account_number
    meta.dig('bank_account_number')
  end

  def dob
    Date.parse(meta.dig('dob'))
  end

  private

  def valid_meta
    unless meta.dig('bank_account_number').present?
      errors.add(:bank_account_number, BANK_ACCOUNT_MISSING_ERROR)
    end

    unless meta.dig('dob').present?
      errors.add(:dob, BANK_ACCOUNT_MISSING_ERROR)

      begin
        Date.parse(meta.dig('dob'))
     rescue ArgumentError
        errors.add(:dob, DOB_FORMAT_ERROR)
     end
    end
  end
end