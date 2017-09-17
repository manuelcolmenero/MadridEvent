# **Práctica iOS Avenzado**
## **KeepCoding Startup Engineering Master V (2017)**
- - -

## **Synopsis**
Create a mobile application to display information of Events in Madrid, even when the user has no Internet connection. Events should be shown in a Map.

## **Requeriments**
1. When starting the App for the first time, if there's Internet connection it will download all information from the Shops access point (see below), including all images.
1. The App will cache everything locally: images, data, etc. Even images of the maps. See below for tips
1. Cache is never invalidated, so once everything has been saved, set a flag and never ever access to the network again
1. If there's no Internet connection a message will be shown to the user.
1. While caching the App will show an Activity indicator or other loader. Until you finish caching you don't get to the Main menu.
1. The app will have a main menu screen where we'll add one button & a logo. The button takes us to the list of shops.
1. The list of Events will show in the upper 50% screen a map with one pin for each shop.
1. The list of Shops will show in the lower 50% screen. Logo to the left, background image taking all the row, shop name in the front. Tapping a row takes us to the detail shop screen.
1. All info should be read from a Core Data database
1. If you tap on a pin in the map a callout will open with the logo +
event name. Taping the callout takes us to the detail shop screen.
1. The map will be always centered in madrid, showing also the user
location
1. All data is at least in Spanish & English: should cache all and
display in Spanish (if that's our phone's language) or English
otherwise
1. Shop detail screen should show shop name, description, address,
and a map showing the shops's location without any pin

## **Extra requeriments**
1. Use a git repository to track your code as you go along.
1. To persist information while you're offline use Core Data! You can cache the images using any technique you like (Core Data, a library, archiving files, etc.)
1. Clean architecture would be nice: interactors, managers, etc. Test: model, DAOs

## **Web services**

```sh
Direction HTTPS
```