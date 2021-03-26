class JobTitle < ApplicationRecord

    has_many :magazineoenologistjobtitles
    has_many :magazines, through: :magazineoenologistjobtitles
    has_many :oenologists, through: :magazineoenologistjobtitles
end
