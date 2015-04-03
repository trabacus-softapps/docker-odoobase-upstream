#!/bin/bash

# this is what starts an interactive shell within your container
docker run -ti --rm --volumes-from "odoo.base" docker/odoobase:8.0 /bin/bash
