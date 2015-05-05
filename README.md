A *production-ready* image for Odoo SAAS-6 Upstream 
===================================================

This image weighs just over 1Gb. Keep in mind that Odoo is a very extensive suite of business applications written in Python. We designed this image with built-in external dependencies and almost nothing useless. It is used from development to production on version SAAS-6 with various community addons.

Odoo version
============

This docker builds with a upstream version of Odoo (formerly OpenERP) AND related dependencies. We intend to follow the git.

You may use your own sources simply by binding your local Odoo folder to /opt/odoo/sources/odoo/

Here are the current revisions from https://github.com/odoo/odoo/archive/saas-6.tar.gz for each docker tag

    # production grade
    docker/odoobase-upstream	19a09ceada6163fbd5226b066bf855f45497cc11 (branch saas-6)

Start Odoo
----------

`Usage: docker run [OPTIONS] xyz/odoo-upstream[:TAG] [COMMAND ...]`

Run odoo in a docker container.

Positional arguments:
  COMMAND          The command to run. (default: help)

Commands:
  help             Show this help message
  start            Run odoo server in the background (accept additional arguments passed to odoo command)
  login            Run in shell mode as odoo user

Examples:
----------
  
  Run odoo V8 in the background as `xyz.odooupstream` on localhost:8069 and use /your/local/etc/ to load odoo.conf

	$ docker run --name="xyz.odooupstream" -v /your/local/etc:/opt/odoo/etc -p 8069:8069 -d xyz/odoo:8.0 start

  Run the V8 image with an interactive shell and remove the container on logout

  	$ docker run -ti --rm xyz/odoo-upstream login

  Run the v8 image and enforce a database `mydb` update, then remove the container

	$ docker run -ti --rm  xyz/odoo-upstream start --update=all --workers=0 --max-cron-threads=0 --no-xmlrpc --database=mydb --stop-after-init
