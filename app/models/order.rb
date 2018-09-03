class Order < ApplicationRecord
  belongs_to :user
  belongs_to :document
  monetize :amount_cents
end
