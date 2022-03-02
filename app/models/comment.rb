class Comment < ApplicationRecord

    # データベース関連付け sはいらない
    belongs_to :user
    belongs_to :protein

    # バリデーション
    validates :comment, presence: true
end
