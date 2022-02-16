class User < ApplicationRecord

    # carriewave
    mount_uploader :avatar_image, ImageUploader

    # パスワード暗号化
    has_secure_password

    # データベース関連付け
    has_many :proteins, dependent: :destroy
    has_many :follower, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
    has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :follow_user, through: :follower, source: :passive # 自分がフォローしている人
    has_many :followed_user, through: :followed, source: :active # 自分をフォローしている人
    has_many :comments



end
