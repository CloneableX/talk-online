import consumer from "./consumer"

const messagesChannel = {
  create: (roomNumber, receivedFun) => {
    return consumer.subscriptions.create({channel: "MessagesChannel", room_number: roomNumber}, {
      initialized() {
        this.sendMessage = this.sendMessage.bind(this)
      },

      received(data) {
        receivedFun.call(this, data.html)
      },

      sendMessage(message) {
        this.send({message_text: message})
      },
    });
  }
}

export default messagesChannel