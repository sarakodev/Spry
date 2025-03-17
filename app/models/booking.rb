class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :messages

  validates :status, inclusion: { in: ['Pending', 'Accepted', 'Declined'] }

  def accept!
    update(status: 'Accepted')
  end

  def reject!
    update(status: 'Declined')
  end
end
