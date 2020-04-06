class ProviderDetailBroadcastJob < ApplicationJob
  queue_as :default

  def perform(provider_detail)
      # Do something later
      ActionCable.server.broadcast "provider_detail_channel", {
        provider_detail: render_provider_detail(provider_detail)
      }
    end
  
    private
  
    def render_provider_detail(provider_detail)
      ProviderDetailsController.render(
        partial: '/home/provider_detail', 
        locals: {
          provider_detail: provider_detail
        }
      )
    end
end
