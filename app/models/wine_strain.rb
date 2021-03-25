class WineStrain < ApplicationRecord
  belongs_to :wine, dependent: :destroy
  belongs_to :strain, dependent: :destroy
end
