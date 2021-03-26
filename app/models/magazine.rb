class Magazine < ApplicationRecord

has_many :magazineoenologistjobtitles
has_many :oenologists, through: :magazineoenologistjobtitles
has_many :job_titles, through: :magazineoenologistjobtitles

end
