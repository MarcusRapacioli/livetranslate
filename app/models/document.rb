class Document < ApplicationRecord
  belongs_to :lesson
  belongs_to :business, class_name: 'User', foreign_key: 'user_id'
  has_many :sections
  monetize :price_cents
  has_one :order

  validates :title, presence: :true
  validates :lesson, presence: true
  # validates :original_content, presence: :true

  mount_uploader :pdf, PdfUploader

   def slug
    title.split.join('_').downcase
   end
end
