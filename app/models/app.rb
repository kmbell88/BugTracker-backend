class App < ApplicationRecord
  has_many :bugs, dependent: :destroy
end
