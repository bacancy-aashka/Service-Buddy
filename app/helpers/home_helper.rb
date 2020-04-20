module HomeHelper
    def select_city
      ProviderDetail.select(:city).distinct
    end

    def set_categories(user)
      @categories = []
      user.provider.provider_details.each do |provider_detail|
        category = provider_detail.category
        @categories.push(category)
      end
      @categories.to_a
    end
end
