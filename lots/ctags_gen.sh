#!/bin/bash
ctags -R --c-types=+l --extra=+q --exclude=node_modules --exclude=build --exclude=bower_components $1
