class User < ApplicationRecord

    # carriewave
    mount_uploader :avatar_image, ImageUploader

    # パスワード暗号化
    has_secure_password

    # データベース関連付け
    has_many :proteins, dependent: :destroy
    has_many :follow, class_name: "Relation", foreign_key: "follow_id", dependent: :destroy
    has_many :follower, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
    has_many :follow_user, through: :follow, source: :passive # 自分がフォローしている人
    has_many :follower_user, through: :follower, source: :active # 自分をフォローしている人
    has_many :comments



end
