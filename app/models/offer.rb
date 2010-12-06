class Offer < ActiveRecord::Base
  validates :kind, :inclusion => I18n.t(:offers)
  validates :square, :numericality => true
  validates :price, :numericality => true
end
