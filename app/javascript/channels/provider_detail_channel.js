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
    console.log("Receiving provider detail");
    debugger
    $('#provider-detail').append(data['provider_detail']);
  }
});
