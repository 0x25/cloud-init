#!/usr/bin/env python2
# -*- coding: utf8 -*-

import irclib
import ircbot
import random
import base64

class BotModeration(ircbot.SingleServerIRCBot):
    def __init__(self):
        """
        bot init
        """
        ip = "127.0.0.1"
        port = 6667
        name = "bot666"
        message = "..."

        ircbot.SingleServerIRCBot.__init__(self, [(ip, port)], name, message)

    def on_welcome(self, serv, ev):
        """
        Méthode appelée une fois connecté et identifié.
        Notez qu'on ne peut rejoindre les canaux auparavant.
        """
        serv.join("#test")

    def on_pubmsg(self, serv, ev):
        """
        Méthode appelée à la réception d'un message, qui exclut son expéditeur s'il
        écrit une insulte.
        """
        # Il n'est pas indispensable de passer par des variables
        # Ici elles permettent de clarifier le tout.
        auteur = irclib.nm_to_n(ev.source())
        canal = ev.target()
        message = ev.arguments()[0].lower() # Les insultes sont écrites en minuscules.
        res = ''
        eicar = 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*'

        if '!eicar' in message:
                serv.privmsg(canal,eicar)

        if '!b64' in message:
                s = eicar
                res = base64.b64encode(eicar)
                serv.privmsg(canal,res)


if __name__ == "__main__":
    BotModeration().start()

