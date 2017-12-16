class Song < ActiveRecord::Base
    belongs_to :user, required: true
    has_many :adds
    has_many :added_users, through: :adds, source: :user

    validates :artist, :title, length: { minimum: 2 }
end
