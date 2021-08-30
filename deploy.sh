#! /bin/bash

set -e

flutter build web

# deploy to GitHub pages and caiopo.com
npx gh-pages@3.0.0 -d build/web/ -b master
