class Wine < ApplicationRecord
  has_many :wine_strains
  has_and_belongs_to_many :oenologists
  has_many :strains, through: :wine_strains, dependent: :destroy
  
  def addStrainPercent(percents)
    percents.each do |strain_id, percentage| 
      if percentage != "" && percentage != "0"
      temp_strain = self.wine_strains.where(strain_id: strain_id).first
      temp_strain.percentage = percentage.to_i
      temp_strain.save
      end
    end
  end

  def getPercentageByStrainId(strain_id)
    if self.wine_strains.where(strain_id: strain_id).first
      self.wine_strains.where(strain_id: strain_id).first.percentage.to_i
    end
  end


end

