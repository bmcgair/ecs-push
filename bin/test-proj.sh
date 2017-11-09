#! /bin/bash
source ./bin/env.sh
kompose run web python manage.py test
