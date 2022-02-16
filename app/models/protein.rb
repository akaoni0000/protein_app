class Protein < ApplicationRecord

    # carriewave
    mount_uploaders :protein_images, ImageUploader
    serialize :protein_images, JSON

    # データベース関連付け
    belongs_to :user
    has_many :comments
    has_many :favorites

end
