#!/usr/bin/python3
import configparser
import imaplib
import os


def print_unseen(username, password):
    imap = imaplib.IMAP4_SSL('imap.zoho.eu', 993)
    imap.login(username, password)

    def count(folder):
        imap.select(folder)
        return_code, mail_ids = imap.search(None, 'Unseen')
        ids = mail_ids[0].decode('utf-8')
        num = (len(ids.split(' ')) if ids else 0)
        return num

    print(count('INBOX') + count('Spam'))
    imap.close()


def get_config():
    config = configparser.ConfigParser()
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                        '../config.ini')
    config.read(path)
    return config


config = get_config()['email']
print_unseen(config['user'], config['password'])
