class Favorite < ApplicationRecord

    # データベース関連付け
    belongs_to :users
    belongs_to :comments
end
