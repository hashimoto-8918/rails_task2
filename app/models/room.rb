class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_introduction, presence: true, length: { maximum: 30 }
    validates :room_price, presence: true
    validates :room_area, presence: true
    validates :room_image, presence: true

    validate :minus_price

    has_many :reservations, dependent: :destroy
    belongs_to :user

    mount_uploader :room_image, ImageUploader

    private

    def minus_price
      errors.add(:room_price, "は１円以上にしてください。") if room_price&. <= 0
    end
end
