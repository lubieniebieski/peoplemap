# PeopleApp

**PeopleApp** (temporary name) by [lubieniebieski@gmail.com](mailto:lubieniebieski@gmail.com) and TeamAlpha.

## Getting started

#### 1. Prerequisites

- Node.js
- NPM (Node Package Manager)
- Ruby ;)
- Compass gem

#### 2. Clone GitHub repository

#### 3. Setup project

Run in the project directory:

```
npm install
npm -g install bower && bower install # -g installs bower globally
```

This should install Yeoman, Bower & Grunt.js.
You can verify installation and versions with:

```
yo --version && bower --version && grunt --version
```

If all went well you should see something like:

```
1.2.1
1.3.8
grunt-cli v0.1.13
```

#### 4. Run app

```
grunt serve
```

#### Todo:

* play more with Google Maps API
* maps are extracted to a separate template
* add coordinates to users and show them on map
* validating coordinates
* each new user triggers showing a new marker
* users are fetched from Users API
* live map reload based on Users API

### Credits

We use map icons provided as a list here http://reubn.tk/GoogleMapIcons/. Those are icons used by Google.
