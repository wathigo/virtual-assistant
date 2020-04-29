import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data, 'received!!')
    $('#messages').append('<div class="message"> ' + data.message.message + '</div>')
    document.querySelector('#value').value = ''
    document.querySelector('.chat-cont').scrollTop = document.querySelector('.chat-cont').scrollHeight;

  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});


