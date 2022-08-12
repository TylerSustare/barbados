# barbados

# Deploy Web as separate build

- `flutter build web`
- `cd build/web`
- `fly deploy --local-only`

# Deploy web on dart server

- `cd flutter`
- `flutter build web`
- `cp -r build/web/ ../api/public`
- `cd ../api`
- `fly deploy --local-only`
