#!/usr/bin/python
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
            compiled.write(compiled_content)
            if append_path:
                with open(append_path, 'r') as append:
                    compiled.write('\n\n' + append.read())


def mutt(config):
    # compile mutt
    _compile_config(config, 'mutt/muttrc')


def i3status(config):
    # compile i3status
    _compile_config(config, 'i3/i3status.conf')


def i3(config):
    # compile i3
    append_path = 'i3/config.' + config['env']['host']
    _compile_config(config, 'i3/config', append_path)


config = get_config()
mutt(config)
i3status(config)
i3(config)
