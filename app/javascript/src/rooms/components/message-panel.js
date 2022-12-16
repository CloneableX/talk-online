import messagesChannel from "../../../channels/messages_channel";

class MessagePanel {
  constructor(roomNumber) {
    this.channel = messagesChannel.create(roomNumber, this.displayMessage)
    this.installListener()
  }

  static setup(roomNumber) {
    new MessagePanel(roomNumber)
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