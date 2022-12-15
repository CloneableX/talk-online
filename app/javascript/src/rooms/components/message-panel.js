import messagesChannel from "../../../channels/messages_channel";

class MessagePanel {
  constructor() {
    this.channel = messagesChannel.create(this.displayMessage)
    this.installListener()
  }

  static setup() {
    new MessagePanel()
  }

  installListener() {
    $('#send-button').on('click', this.sendMessage)
  }

  displayMessage(messageHtml) {
    $('.message-container').append(messageHtml)
  }

  sendMessage = () => {
    const messageTextArea = $('textarea');
    this.channel.sendMessage(messageTextArea.val())
    messageTextArea.val('')
  }
}

export default MessagePanel