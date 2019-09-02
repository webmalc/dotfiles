#!/usr/bin/python
import commands
import configparser
import datetime
import json
import os
import smtplib


def send_email(user, pwd, recipient, subject, body):

    FROM = user
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = subject
    TEXT = body

    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(user, pwd)
        server.sendmail(FROM, TO, message)
        server.close()
        print 'successfully sent the mail'
    except:
        print "failed to send mail"


def get_config():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    filename = os.path.join(base_dir, 'config.ini')
    config = configparser.ConfigParser()
    config.read(filename)

    return config


def get_text():
    filter_date = datetime.date.today() + datetime.timedelta(days=2)
    filter_date = filter_date.strftime('%Y-%m-%d')
    tasks_str = commands.getstatusoutput(
        'task "due:{}" export'.format(filter_date))[1]
    tasks = [x for x in json.loads(tasks_str) if x['status'] != 'deleted']
    text = ''

    for task in tasks:
        due = datetime.datetime.strptime(
            task['due'].split('T')[0],
            '%Y%m%d',
        )
        due = due + datetime.timedelta(days=1)
        text += '{}.  {} due {}'.format(
            task['id'],
            task['description'],
            due.strftime('%d %B, %Y'),
        )
        text += '\n\n'
    return text


PARAMS = get_config()
TEXT = get_text()
if TEXT:
    send_email(
        PARAMS['email']['user'],
        PARAMS['email']['password'],
        PARAMS['email']['recipient'],
        'Taskwarrior: tomorrow',
        TEXT,
    )
