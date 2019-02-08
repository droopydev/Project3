class Centre < ActiveRecord::Base
    # AR classes are singular and capitalized by convention
    # attr_accessible :avatar
    belongs_to :user
    has_and_belongs_to_many :courses
    mount_uploader :avatar, AvatarUploader
    validates :contact_no, numericality: { only_integer: true, message: ": %{value} should only include numbers" }
end