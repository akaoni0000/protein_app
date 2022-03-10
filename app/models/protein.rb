class Protein < ApplicationRecord

    # gem 'order_as_specified'
    extend OrderAsSpecified

    # carriewave
    mount_uploaders :protein_images, ImageUploader
    serialize :protein_images, JSON

    # データベース関連付け
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    # バリデーション
    validates :name, presence: true
    validates :feature, length: { minimum: 5 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 30000 }
    validates :weight, presence: true
    validates :protein_weight, presence: true
    validates :large_weight, presence: true, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 30000 }
    validates :taste, presence: true

    # カスタムバリデーション
    validate :correct_weight
    def correct_weight
        if weight.present? && protein_weight.present? && weight <= protein_weight
            errors.add(:weight, "はタンパク質の重さより大きくなくてはいけません")
        end
        if large_weight.present? && weight.present? && large_weight <= weight
            errors.add(:large_weight, "は1食分の重さより大きくなくてはいけません")
        end
    end


    
end
