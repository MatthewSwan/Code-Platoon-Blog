class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true

  def summary
    text.split("\n\n").first
  end
end
