class ListItem < ApplicationRecord
  belongs_to :list
  validate :valid_meta

  # State machine is probably better
  def approve!
    update(approved_at: DateTime.now)
  end

  def reject!
    update(rejected_at: DateTime.now)
  end

  def approved?
    return false unless approved_at.present?
    return true if rejected_at.nil?
    approved_at > rejected_at
  end

  def rejected?
    return false unless rejected_at.present?
    return true if approved_at.nil?
    rejected_at > approved_at
  end

  private

  def valid_meta
    raise NotImplementedError
  end
end
