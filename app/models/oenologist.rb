class Oenologist < ApplicationRecord
    has_many :wines
    has_many :magazineoenologistjobtitles
    has_many :oenologists, through: :magazineoenologistjobtitles
    has_many :job_titles, through: :magazineoenologistjobtitles
    

    def set_references(arr_jobs)

    self.magazineoenologistjobtitles.destroy_all
    arr_jobs = arr_jobs.reject { |m| m.empty? }
    arr_jobs.each do |m, jobs|
        jobs = jobs.reject { |j| j.empty? }
        jobs.each do |j|
            temp_moj = magazineoenologistjobtitles.new
            temp_moj.magazine = Magazine.find(m.to_i)
            temp_moj.job_title = JobTitle.find(j.to_i)
            temp_moj.oenologist = self
            temp_moj.save
            end
        end
    end
end
