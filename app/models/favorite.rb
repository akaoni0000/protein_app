class Favorite < ApplicationRecord

    # データベース関連付け
    belongs_to :user
    belongs_to :protein
end
