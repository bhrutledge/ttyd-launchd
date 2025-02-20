# ttyd-launchd

Set up a macOS [launchd](https://launchd.info/) service for [ttyd](https://github.com/tsl0922/ttyd), a command-line tool for using a terminal in a web browser.

## Installation

```sh
brew install gettext ttyd

make install
```

This will install and start a service called `localhost.ttyd`.

## Usage

Open <http://localhost:7681/> in a web browser to access the terminal.

For quick access, add that to your Bookmarks Bar with a name like "Terminal".

The `localhost.ttyd` service should start whenever you reboot.
