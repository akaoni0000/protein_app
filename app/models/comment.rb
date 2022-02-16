class Comment < ApplicationRecord

    # データベース関連付け
    belongs_to :users
    belongs_to :proteins
end
