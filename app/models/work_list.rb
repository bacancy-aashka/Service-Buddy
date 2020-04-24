class WorkList < ApplicationRecord
  belongs_to :provider
  belongs_to :category

  # VALIDATION :
  validates :title, :description, presence: true

  before_create {
    if date < Date.today
      throw :abort
    end
  }

  def date_past?
    if date.present?
      if date < Date.today
        errors.add(:date, "can't be in the Past")
      end
    else
      errors.add(:date, "can't be blank")
    end  
  end

  def self.individual_provider_detail_graph(params, provider_detail)
    if (params[:min_date] && params[:max_date]).present?
      start_date = Date.parse(params[:min_date])
      end_date = Date.parse(params[:max_date])
      WorkList.where("provider_id = ? AND date between ? AND ? AND category_id = ?",provider_detail.provider.id, start_date, end_date, provider_detail.category_id ).group_by_day(:date).count  
    else 
      WorkList.where("provider_id = ? AND category_id = ?",provider_detail.provider.id, provider_detail.category_id ).group_by_day(:date).count   
    end
  end

  def self.all_provider_detail_graph(params, user)
    if (params[:min_date] && params[:max_date]).present?
      start_date = Date.parse(params[:min_date])
      end_date = Date.parse(params[:max_date])
      WorkList.where("provider_id = ? AND date between ? AND ?",user.provider.id, start_date, end_date).group_by_day(:date).count
    else
      WorkList.where("provider_id = ?",user.provider.id).group_by_day(:date).count  
    end 
  end

end
