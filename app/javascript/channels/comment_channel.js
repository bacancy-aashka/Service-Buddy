import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
     // Called when the subscription is ready for use on the server
    console.log("Here you are connected to Comment channel.");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Receiving");
    $('#action_cable_comment').append(data['comment']);
  }
});
