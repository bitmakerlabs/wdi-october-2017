addEventListener('DOMContentLoaded', () => {
  logged_in.innerText = location.search.substr(1)

  const chat_channel = App.cable.subscriptions.create('ChatChannel', {
    connected:    () => { messages.append('connected\n') },
    disconnected: () => { messages.append('disconnected\n') },
    received:     data => {
      messages.append(`${data.username}: ${data.message}\n`)
    }
  })

  form_message.addEventListener('submit', e => {
    e.preventDefault()
    const username = location.search.substr(1)
    const message  = text_message.value
    chat_channel.send({ username, message })
    text_message.value = ''
  })

})