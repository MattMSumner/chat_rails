App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    return document
      .getElementById('messages')
      .appendChild(this.renderMessage(data));
  },

  renderMessage: function(data) {
    var name = document.createElement('b');
    name.innerHTML = data.user + ':';

    var message = document.createElement('span');
    message.innerHTML = ' ' + data.message;

    var p = document.createElement('p');
    p.appendChild(name);
    p.appendChild(message);

    return p;
  },
});
