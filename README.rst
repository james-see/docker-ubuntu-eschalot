docker-ubuntu-eschalot
=======================

WHAT THE HELL IS THIS?
----------------------

Eschalot is a way to generate vanity .onion urls using CPU cores. There are at least a few other programs to do this including shallot and also one written in Go. I was tired of trying to build eschalot and failing the build due to OpenSSL errors on macOS, so I made this since the required code was a few apt-get's away.

INSTALL GUIDE
-------------

1. Clone this repo via your fav git clone method (https / ssh)
2. Change directory into this repo ``cd docker-ubuntu-eschalot``
3. Edit the Dockerfile username:password from root:changeme (``nano Dockerfile`` make change then CTRL+X and 'y')
4. Run `` sudo docker build -t [whatever name you want here] .``

RUN GUIDE
---------

1. After install run via ``docker run -d -P --name [name you want docker container to be called] [name you chose in step 4 above]``
2. Run ``docker port test sshd`` to check assigned port to your docker container that is running.
3. ssh into it using the user and password you set in step 3 in the install guide: ``ssh [user]@127.0.0.1 -p[port from 2]``
4. Now that you are in the docker, you can run the eschalot command as much as you want. I like to simply do ``eschalot -v -t8 -p hello`` to do a quick test.
5. Drop the generated private key in your hidden data dir that is set in your torrc file and restart your hidden service and you should be GTG. For questions, go ahead and send me a message via email (pgp key available over at keybase.io) or on twitter @jamescampbell.

For examples and more check out the readme at https://github.com/ReclaimYourPrivacy/eschalot





