#!/usr/bin/python3
import re
import textwrap
import argparse


def _read_file(filename: str):
    with open(filename, "r") as f:
        while line := f.readline():
            yield line


def _format_conky_header(match):
    header_name = match.group(1).strip()
    return (
        f"${{font Ubuntu Mono:size=16:weight:bold}}"
        f"${{color2}}{header_name}: "
        f"${{color}}"
        f"${{font Ubuntu Mono:size=11}}"
    )


def _replace_headers(text: str) -> str:
    pattern = re.compile(r"^##\s+(.+)$", re.MULTILINE)
    return pattern.sub(_format_conky_header, text)


def process_file(filename: str) -> str:
    result = []
    for line in _read_file(filename):
        if line.startswith("#"):
            line = _replace_headers(line)
        else:
            line = textwrap.fill(
                line,
                35,
                drop_whitespace=False,
                replace_whitespace=False,
            )
        result.append(line)
    return "".join(result[2:])


def _get_filename_from_args() -> str:
    parser = argparse.ArgumentParser()
    parser.add_argument("filename")
    args = parser.parse_args()
    return args.filename


if __name__ == "__main__":
    print(process_file(_get_filename_from_args()))
