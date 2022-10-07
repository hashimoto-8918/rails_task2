class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :room_price, presence: true
    validates :room_area, presence: true
    validates :room_image, presence: true

    mount_uploader :room_image, ImageUploader
end
