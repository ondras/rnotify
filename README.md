# rnotify

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
   
