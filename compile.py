#!/usr/bin/python
import configparser


def get_config():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config


def _compile_config(config, path):
    # compile
    print('compile' + path)
    with open(path + '.template', 'r') as template:
        content = template.read()
        with open(path + '.compiled', 'w+') as compiled:
            compiled_content = content.replace('{{email_password}}',
                                               config['email']['password'])
            compiled.write(compiled_content)


def mutt(config):
    # compile mutt
    _compile_config(config, 'mutt/muttrc')


def i3status(config):
    # compile i3status
    _compile_config(config, 'i3/i3status.conf')


config = get_config()
mutt(config)
i3status(config)
