class Tuition < ActiveRecord::Base
    # AR classes are singular and capitalized by convention
    # attr_accessible :avatar
    belongs_to :user
    mount_uploader :avatar, AvatarUploader

end