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
    has_many :comments, dependent: :destroy

    # バリデーション
    validates :name, uniqueness: true, length: { in: 1..10 }
    validates :email, presence: true, uniqueness: true
    validates :password, length: { in: 6..20 }, on: :create

    def createFollow(user_id)
        Relation.create(follow_id: self.id, followed_id: user_id)
    end

    def destroyFollow(user_id)
        Relation.find_by(follow_id: self.id, followed_id: user_id).destroy
    end

    def follow?(user_id)
        return Relation.find_by(follow_id: self.id, followed_id: user_id).present?
    end

    def followed?(user_id)
        return Relation.find_by(follow_id: user_id, followed_id: self.id).present?
    end

end
