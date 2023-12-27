#!/usr/bin/env python3
from plexapi.myplex import MyPlexAccount
from plexapi.server import PlexServer
from plexapi.playqueue import PlayQueue
from dotenv import load_dotenv
load_dotenv()
from os import environ
account = MyPlexAccount(environ["PLEX_USER"], environ["PLEX_PASSWORD"])
client = [r.name for r in account.resources() if r.publicAddressMatches and r.product == "Plexamp"][0]
plexamp = account.resource(client).connect()
token = account.resource(environ["PLEX_SERVER_NAME"]).accessToken
laptop = PlexServer(environ["PLEX_SERVER_ADDR"], token)
music = laptop.library.section("Music")
pq = PlayQueue.create(laptop, music.playlist("Recently Added"), shuffle=1, continuous=1)
plexamp.playMedia(pq)
