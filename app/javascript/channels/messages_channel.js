import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    this.install()
  },

  install() {
    $('#send-button').on('click', () => {
      this.send({ message_text: $('textarea').val() })
    })
  }
});
