class Course < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :centres
    mount_uploader :avatar, AvatarUploader

    validates :credits, numericality: { only_integer: true, message: ": %{value} should only include numbers" }
end