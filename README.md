# rnotify
This is a tiny script that forwards messages to a (local) notification daemon. Client side simply dumps all data to port 1337, server side listens (netcat) and passes received stuff to notify-send. Startup and server reloading is managed via systemd unit file.

## Prerequisites
  * netcat
  * systemd (local machine)
  * notify-send (local machine)

## Installation
1. Clone the repo (all relevant machines):

    ```
    git clone git@github.com:ondras/rnotify.git
    ```

1. Symlink the `rnotify.service` to your per-user systemd configuration directory (only the local machine):

    ```bash
    cd rnotify
    mkdir -p ~/.config/systemd/user
    ln -s `pwd`/rnotify.service ~/.config/systemd/user
    systemctl --user daemon-reload
    ```

## Running
1. Start the listening service:

    ```bash
    systemctl --user start rnotify
    ```
    
1. Test it locally:

    ```bash
    ./rnotify-send "This is a test"
    ```
    
1. Create a forwarding tunnel to another machine:

    ```bash
    ssh -R 1337:0:1337 user@host
    ```

1. Test it remotely:
   ```bash
   user@host> ./rnotify-send "This is a remote test"
   ```
   
## WeeChat integration
```
/script install notify_send.pl
/set plugins.var.perl.notify_send.command "/path/to/rnotify/rnotify-send $type $name $message"
```
