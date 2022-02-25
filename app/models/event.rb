class Event < ApplicationRecord
  is_impressionable counter_cache: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :charge, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 30_000 },
                      presence: { message: "Can't be blank" }
  end

  validates :title, :date, :place, :content, :image, presence: true
  has_one_attached :image
  belongs_to :user
  has_many :likes

  def self.search(search)
    if search != ""
      Event.where('content LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end

  
end
