#!/usr/bin/python
import configparser


def get_config():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config


def mutt(config):
    # compile mutt
    print('compile mutt')
    with open('mutt/muttrc.template', 'r') as template:
        content = template.read()
        with open('mutt/muttrc.compiled', 'w+') as compiled:
            compiled_content = content.replace('{{email_password}}',
                                               config['email']['password'])
            compiled.write(compiled_content)


config = get_config()
mutt(config)
