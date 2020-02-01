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
            compiled_content = content.replace(
                '{{mpd}}', config['mpd']['mpd'])
            compiled_content = compiled_content.replace(
                '{{tr_auth}}', config['transmission']['tr_auth'])
            compiled.write(compiled_content)
            if append_path:
                with open(append_path, 'r') as append:
                    compiled.write('\n\n' + append.read())


def env(config):
    # compile env
    _compile_config(config, 'env/environment')

config = get_config()
env(config)
