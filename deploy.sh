#! /bin/bash

set -e

# build using CanvasKit rendering backend
flutter build web --dart-define=FLUTTER_WEB_USE_SKIA=true

# deploy to GitHub pages and caiopo.com
npx gh-pages@3.0.0 -d build/web/ -b master
