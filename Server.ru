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
        for event in self.long_poll.listen():

        if event.type == VkBotEventType.MESSAGE_NEW:

          print("Username: " + self.get_user_name(event.object.from_id))
            print("From: " + self.get_user_city(event.object.from_id))
            print("Text: " + event.object.text)
            print("Type: ", end="")
            if event.object.id > 0:
                print("private message")
            else:
                print("group message")
            print(" --- ")

    def get_connection():
    connection = pymysql.connect(host="%name_host%",
            user="%name_user%",
            password="%password_user%",
            db="vktest",
            charset="utf8mb4",
            cursorclass=pymysql.cursors.DictCursor)
    return connection
        
    def update_position(id_user, new_position):
    connection = get_connection()
    try:
        with connection.cursor() as cursor:
            sql = "UPDATE user SET position = %s WHERE iduser = %s"
            cursor.execute(sql, (new_position, id_user))
        connection.commit()
    finally:
        connection.close()
    return    
        
    def send_message(id_user, id_keyboard, message_text):
    try:
        vk.messages.send(
            user_id=id_user,
            random_id=get_random_id(),
            attachment=get_attachment,
            keyboard=open(id_keyboard, 'r', encoding='UTF-8').read(),
            message=message_text)
    except:
        print("Ошибка отправки сообщения у id" + id_user)    
        
     def get_user_name(self, user_id):
        """ Получаем имя пользователя"""
        return self.vk_api.user.get(user_id=user_id)[0]['first_name']

     def get_user_city(self, user_id):
        """ Получаем город пользователя"""
        return self.vk_api.user.get(user_id=user_id, fields="city")[0]["city"]['title']
    
     def questionnaires(self, user_id):
        self.quest = self.get.quest()
        self.enum = self.get.quest()
        vk_user.method ('get.messages', {'user_id': user_id, 'quest': quest,  'random_id': randrange(10 ** 7)})    
         
     def get_photos(user_id):
        photos = vk_user.method('photos.getAll', {'owner_id': user_id, 'extended': 1})
        return photos
        
     def msg(user_id, message, attachment=None, keyboard=None):
        vk_group.method('messages.send', {'user_id': user_id, 'message': message,  'random_id': randrange(10 ** 7), 'attachment': attachment})
