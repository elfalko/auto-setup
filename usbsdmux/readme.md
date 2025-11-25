# automux

Scripts to simplify using [linux-automation's usb-sd-muxer](https://github.com/linux-automation/usbsdmux)

## setup

- install `usbsdmux`
- Add yourself to `plugdev` and [setup udev rules](https://github.com/linux-automation/usbsdmux)
- source `automux.sh`


## Usage

This command always takes the latest usb-sd-muxer. Otherwise it uses the same syntax as the default `usbsdmux`:

``` bash
automux get
automux dut
automux host
```

