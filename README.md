from vk_api import VkApi
from vk_api.bot_longpoll import VkBotLongPoll, VkBotEventType
from vk_api.utils import get_random_id


vk_session = VkApi(token='[access_token]')
longpoll = VkBotLongPoll(vk_session, '[group_id]')
vk = vk_session.get_api()


def main():
    for event in longpoll.listen():
        if event.type == VkBotEventType.MESSAGE_NEW:
            vk.messages.send(
                random_id=get_random_id(),
                peer_id=event.obj['peer_id'],
                message='Test message',
            )


if __name__ == '__main__':
    main()

        if event.to_me:
            request = event.text

            if request == "привет":
                write_msg(event.user_id, f"Хай, {event.user_id}")
            elif request == "пока":
                write_msg(event.user_id, "Пока((")
            else:
                write_msg(event.user_id, "Не поняла вашего ответа...")
