class Strain < ApplicationRecord
  has_many :wine_strains
  has_many :wines, through: :wine_strains, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
end
