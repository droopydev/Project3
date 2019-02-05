class Course < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :centres
    mount_uploader :avatar, AvatarUploader
end