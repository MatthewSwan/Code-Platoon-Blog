class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true

  def summary
    if text.length > 20
      text[0..19] + '...'
    else
      text
    end
  end
end
