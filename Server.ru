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

status = {'stat' : 0}

    def main():

    for event in longpoll.listen():
        if event.type == VkEventType.MESSAGE_NEW and event.text :

            if event.text == 'Привет-привет' and not status['stat']:  
                if event.from_user: 
                    vk.messages.send(
                        peer_id=event.obj.from_id,
                        message='Введите запрос',
                        random_id=get_random_id()
                    )
                if event.from_chat:
                    vk.messages.send(
                        peer_id=event.obj.peer_id,
                        message='Введите запрос',
                        random_id=get_random_id()
                    )
                status['stat'] = 1
            elif status['stat']:
                status['stat'] = 0
        
    def get_photos(user_id):
        photos = vk_user.method('photos.getAll', {'owner_id': user_id, 'extended': 1})
        return photos
        
    def msg(user_id, message, attachment=None, keyboard=None):
        vk_group.method('messages.send', {'user_id': user_id, 'message': message,  'random_id': randrange(10 ** 7), 'attachment': attachment})
