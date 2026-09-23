#!/usr/bin/env python3
"""Fetch and display recent GitHub events for a user."""

import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'


def retrieve_events(url):
    """Download events from the GitHub API and return them as a list of dicts."""
    response_text = requests.get(url).text
    events = json.loads(response_text)
    return events


def print_events(events, n=5):
    """Print the first n events, one per line, as 'type :: repo'."""
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)


def main():
    """Show the user and URL, then fetch and print their recent events."""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()