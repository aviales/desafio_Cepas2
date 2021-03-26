class Magazineoenologistjobtitle < ApplicationRecord
  belongs_to :magazine
  belongs_to :oenologist
  belongs_to :job_title
end
