import consumer from "./consumer"

consumer.subscriptions.create("ProviderDetailChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to Provider Detail channel.")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    // Here data['provider_detail'] is in string, hence it is converted to html for implementation of different JS methods.

    console.log("Receiving provider detail");

    var data_to_html = document.createElement('div');
    data_to_html.innerHTML = data['provider_detail'];

    var found_provider_detail = $('#provider-detail').find("[id='" + data_to_html.firstChild.id + "']");

    if (found_provider_detail.length != 0)  
    {
      found_provider_detail.replaceWith(data_to_html);
    } 
    else 
    {
      console.log("data not found");
      $('#provider-detail').append(data['provider_detail']);
    }  

    var data_to_html = null;
    var found_provider_detail = null;
  }
});
