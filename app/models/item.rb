class Item < ActiveRecord::Base
  belongs_to :list

  def completed?
    !completed_at.blank?
  end

  def toggle_completion
    if completed?
      update_attribute(:completed_at, nil)
    else
      update_attribute(:completed_at, Time.now)
    end
  end
  
end
