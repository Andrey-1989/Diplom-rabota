import vk_api.vk_api

from vk_api.bot_longpoll import VkBotLongPoll
from vk_api.bot_longpoll import VkBotEventType


class Server:

    def __init__(self, api_token, group_id, server_name: str="Empty"):

        # Даем серверу имя
        self.server_name = server_name

        # Для Long Poll
        self.vk = vk_api.VkApi(token=api_token)

        # Для использоания Long Poll API
        self.long_poll = VkBot(self.vk, group_id, wait=20)

        # Для вызова методов vk_api
        self.vk_api = self.vk.get_api()

    def send_msg(self, send_id, message):
        """
        Отправка сообщения через метод messages.send
        :param send_id: vk id пользователя, который получит сообщение
        :param message: содержимое отправляемого письма
        :return: None
        """
        self.vk_api.messages.send(peer_id=send_id,
                                  message=message)

    def test(self):
        self.send_msg(255396611, "Привет-привет!")

    def start(self):
        for event in self.long_poll.listen():   # Слушаем сервер

            # Пришло новое сообщение
            if event.type == VkBotEventType.MESSAGE_NEW:

                username = self.get_user_name(event.object.from_id)
                print("Username: " + username)
                print("From: " + self.get_user_city(event.object.from_id))
                print("Text: " + event.object.text)
                print("Type: ", end="")
                if event.object.id > 0:
                    print("private message")
                else:
                    print("group message")
                print(" --- ")

                self.send_message(event.object.peer_id, f"{username}, я получил ваше сообщение!")

    def get_user_name(self, user_id):
        """ Получаем имя пользователя"""
        return self.vk_api.users.get(user_id=user_id)[0]['first_name']

    def get_user_city(self, user_id):
        """ Получаем город пользователя"""
        return self.vk_api.users.get(user_id=user_id, fields="city")[0]["city"]['title']

    def send_message(self, peer_id, message):
        self.vk_api.messages.send(peer_id=peer_id, message=message)
        
        function getAttachments(data) {
  const attachments = [];

  if (data.geo) {
    attachments.push('geo');
  }

  for (const key in data) {
    const match = key.match(/attach(\d+)$/);

    if (match) {
      const id = match[1];
      const kind = data[`attach${id}_kind`];
      let type = data[`attach${id}_type`];

      if (kind === 'omsg') type = 'message';
      if (kind === 'graffiti') type = 'graffiti';
      if (type === 'group') type = 'event';

      attachments.push(type);
    }
  }

  return attachments;
}
        
