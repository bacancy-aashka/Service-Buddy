module HomeHelper
    def select_city
        ProviderDetail.select(:city).distinct
    end
end
