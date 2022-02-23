class Protein < ApplicationRecord

    # carriewave
    mount_uploaders :protein_images, ImageUploader
    serialize :protein_images, JSON

    # データベース関連付け
    belongs_to :user
    has_many :comments
    has_many :favorites

    # バリデーション
    validates :name, presence: true
    validates :feature, length: { minimum: 10 }
    validates :price, presence: true
    validates :height, presence: true
    validates :protein_height, presence: true
    validates :large_height, presence: true
    # カスタムバリデーション
    validate :correct_height
    def correct_height
        if height.present? && protein_height.present? && height < protein_height
            errors.add(:height, "はタンパク質の重さより小さくなくてはいけません")
        end
        if large_height.present? && height.present? && large_height < height
            errors.add(:large_height, "は1食分の重さより大きくなくてはいけません")
        end
    end

end
