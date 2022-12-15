import messagesChannel from "../../channels/messages_channel";

$(document).on('turbolinks:load', () => {
  const sendMessage = () => {
    const messageTextArea = $('textarea');
    channel.sendMessage(messageTextArea.val())
    messageTextArea.val('')
  }

  const displayMessage = (messageHtml) => {
    $('.message-container').append(messageHtml)
  }

  const channel = messagesChannel.create(displayMessage)
  $('#send-button').on('click', sendMessage)
})