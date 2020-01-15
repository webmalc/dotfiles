#!/usr/bin/python3
import configparser


def get_config():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config


def _compile_config(config, path, append_path=None):
    # compile
    print('compile' + path)
    with open(path + '.template', 'r') as template:
        content = template.read()
        with open(path + '.compiled', 'w+') as compiled:
            compiled_content = content.replace('{{email_password}}',
                                               config['email']['password'])

            compiled_content = compiled_content.replace(
                '{{email_user}}', config['email']['user'])
            compiled.write(compiled_content)
            if append_path:
                with open(append_path, 'r') as append:
                    compiled.write('\n\n' + append.read())


def mutt(config):
    # compile mutt
    _compile_config(config, 'mutt/muttrc')

def mainag(config):
    # compile mailnag
    _compile_config(config, 'mailnag/mailnag')


config = get_config()
mutt(config)
mainag(config)
