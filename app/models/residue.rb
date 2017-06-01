class Residue < ApplicationRecord
  belongs_to :laboratory
  belongs_to :collection
  has_many :registers, dependent: :destroy
  
  def total
   self.registers.last.weight
  end
  
  def self.compare_report_att(res, filter)
    if filte.f_kind and self.kind != res.kind then
      return true
    end
    if filter.f_onu and self.onu != res.onu then
      return true
    end
    if filter.f_code and self.code != res.code then
      return true
    end
    if filter.f_blend and self.blend != res.blend then
      return true
    end
    false
  end
end
