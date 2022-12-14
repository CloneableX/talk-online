import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
  initialized() {
    this.sendMessage = this.sendMessage.bind(this)
  },

  connected() {
    this.install()
  },

  received(data) {
    $('.message-container').append(data.html)
  },

  sendMessage() {
    const messageTextArea = $('textarea');
    this.send({message_text: messageTextArea.val()})
    messageTextArea.val('')
  },

  install() {
    $('#send-button').on('click', this.sendMessage)
  }
});
