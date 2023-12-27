plexamp-radio
=============

A tool to stream a playlist from [Plexamp](https://plex.tv/plexamp/) to [Icecast](https://icecast.org) using [butt](https://danielnoethen.de/butt/)

Setup
-----

I'm using Ubuntu 22.04, please research appropriate changes for your operating system.

Install packages:

    # butt
    sudo apt-get install -y libfltk1.3-dev portaudio19-dev libopus-dev libmp3lame-dev libvorbis-dev libogg-dev libflac-dev libfdk-aac-dev libdbus-1-dev libsamplerate0-dev libssl-dev libcurl4-openssl-dev
    # desktop env and utilities
    sudo apt-get install -y xvfb fluxbox flatpak pulseaudio dbus-x11 x11vnc
    # icecast
    sudo apt-get install -y icecast2
    # plexapi
    sudo apt-get install -y python3 python3-pip
    pip install plexapi python-dotenv

Copy `.env.sample` to `.env`, edit with your Plex username, password and server details, including best connection IP for the client

To configure the applications:

* `cat run.sh`, copy and run each command down to before `sleep 5`, copy and run the last command in the file (`x11vnc`), connect to :5900 with vncviewer, make sure you can see the desktop window, Plexamp, and butt.
* Log into Plexamp and configure butt with the icecast server details, using the password you set when installing icecast.
* Play something in Plexamp, and click the Play button in butt to start streaming.
* Go to the icecast web ui, you should see it playing there

Kill the programs with `./stop.sh`, then do a test run of the full automated script `./run.sh`, connect to vnc again, if everything's fine you should see Plexamp playing something, the audio meter in butt moving, and the stream should be present in icecast's web ui

Kill the programs once again, edit `plexamp-radio.service` with your username and the path to the plexamp-radio directory, copy it to `/etc/systemd/system/plexamp-radio.service`, `sudo systemctl enable --now plexamp-radio`
