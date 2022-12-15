import messagesChannel from "../../channels/messages_channel";
import {pageFilter} from "../../components/filters";

$(document).on('turbolinks:load', () => {
  pageFilter('rooms-show-page', () => {
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
})