class Bug < ApplicationRecord
  belongs_to :app
  belongs_to :user
  has_many :notes, dependent: :destroy
end
