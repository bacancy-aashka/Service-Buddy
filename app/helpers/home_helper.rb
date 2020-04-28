module HomeHelper

  def select_city
    ProviderDetail.select(:city).distinct
  end



    def is_favourite?(provider_detail)
     if current_user.favourite_posts.find_by(provider_detail_id: provider_detail.id)
      return  "Remove from Favourite"
     else
      return "Add to Favourite"
     end
    end

    def provider_detail_count
      ProviderDetail.count
    end

  def set_categories(user)
    @categories = []
    if user.provider.present?
      user.provider.provider_details.each do |provider_detail|
        category = provider_detail.category
        @categories.push(category)
      end
    end
    @categories.to_a
  end

  def provider_detail_count
    ProviderDetail.count
  end

  def user_count
    User.count
  end
  
  def category_count
    Category.count
  end

end
