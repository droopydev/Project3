class Tuition < ActiveRecord::Base
    # AR classes are singular and capitalized by convention
    # attr_accessible :avatar

    mount_uploader :avatar, AvatarUploader

end