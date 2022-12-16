import {pageFilter} from "../../components/filters";
import MessagePanel from "./components/message-panel";

$(document).on('turbolinks:load', () => {
  pageFilter('rooms-show-page', () => {
    let roomNumber = $('input#room-number').val()
    MessagePanel.setup(roomNumber)
  })
})