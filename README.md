## Flying Fish sample app

During development we're gong to create what we would like a Flying Fish app to look like. Sometimes the best way to know how to make generators is to do it by hand first.

### Milestone 1 - What do we want the skeleton to look like?

Goals

- [x] Create a very simple REST based backend first
  - [x] Simple DB with [SQLite](https://pub.dev/packages/sqlite3) or [Hive](https://pub.dev/packages/hive)
  - [x] Hot reloads during development with [hotreloader](https://pub.dev/packages/hotreloader)
- [x] Deploy the API to [fly.io](https://fly.io) for maximum schtick about "Fly" and "Flying Fish"
  - [x] [https://barbados.fly.dev](https://barbados.fly.dev/)
- [ ] Modify the default flutter counter app to use the backend
  - [x] created with `flutter create --project-name barbados flutter` to make the app name with a path called `flutter`
  - [ ] Deploy Flutter web version to [fly.io](https://fly.io) for maximum schtick about "Fly" and "Flying Fish"
- [ ] Celebrate

### Retro - Is this useful? What is missing to make this MVP Level

- [ ] How can we bundle this as a monorepo?
- [ ] Can we make a global "start" command for the server and client(s)
- [ ] Can we make a global "deploy" command for the server and web client
- [ ] Should we use the generator package instead? [https://pub.dev/packages/shelf_router_generator](https://pub.dev/packages/shelf_router_generator)
- [ ] Add middleware
- [ ] refactor cycle
