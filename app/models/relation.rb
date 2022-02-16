class Relation < ApplicationRecord

    # データベース関連付け
    belongs_to :active, class_name: "User", foreign_key: "follow_id"
    belongs_to :passive, class_name: "User", foreign_key: "followed_id"
end
