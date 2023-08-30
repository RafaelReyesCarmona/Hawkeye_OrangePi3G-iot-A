## Hawkeye OrangePi3G-iot-A

Hawkeye is a simple, robust, easy to use USB webcam streaming web server which uses MJPEG as the video codec. It is designed to be usable on local networks as well as the Internet, supporting HTTPS and Basic Authentication. It comes with an HTML video stream viewer optimized for desktop and mobile usage. Lastly, Hawkeye supports multiple webcams. This fork is adapted to install Hawkeye on OrangePi3G-iot-A device running Ubuntu 16.04 server.

Hawkeye was built to work on low power devices such as the Raspberry Pi but will work equally well on desktops and laptops alike. The motivation for it was to create a standard no-surprises daemon with batteries included that would pipe (buffered) MJPEG data from the USB webcam(s) to an HTTP or HTTPS connection with as few delays as possible. The project is similar to, and borrows some code from, mjpeg-streamer but aside from the encoding bits is a separate pure C implementation. This project also includes everything you might need to build a Debian-style package to have hawkeye neatly integrated into your Debian-derived OS, from init files, to dependencies, to log rotation.

## Installation

If you are running Debian, Ubuntu, Raspbian, or another Debian derivative, you can use my package repository as follows:

    wget https://github.com/RafaelReyesCarmona/hawkeye/blob/master/hawkeye_20230830-1_armhf.deb
    sudo dpkg -i hawkeye_20230830-1_armhf.deb

If you already have a webcam connected, Hawkeye will start listening on localhost, port 8000. Point your browser to http://localhost:8000/ to view the video stream.

If you want to build Hawkeye from source:

    sudo apt-get install build-essential checkinstall libv4l-dev libjpeg9-dev git
    git clone https://github.com/RafaelReyesCarmona/hawkeye.git
    cd hawkeye/
    make
    sudo checkinstall

## Configuration

All configuration by default is stored in /etc/hawkeye/hawkeye.conf. The configuration options are self-explanatory (host, port, video sources, SSL settings, etc.) Do note that you should obtain a valid SSL certificate and set it up if you plan on accessing these video streams over the Internet. That is the *only* way to secure your video streams from people snooping on them.

## Still images

In addition to the MJPEG streams, you can get stills from each webcam at /still/NUM. For example: http://localhost:8000/still/0

## Hardware Selection

Hawkeye works with UVC (USB Video Class) devices, and can handle both MJPEG and raw YUV streams. Note that MJPEG is highly recommended as that is what Hawkeye outputs so it requires no transcoding. Hawkeye will log a warning if it is unable to use MJPEG directly from the webcam.

Newer webcams should natively output MJPEG but do check the specs before buying them.

The server was tested to run on a regular Ubuntu desktop, a netbook, and a Raspberry Pi. The Raspberry Pi is the primary target for this project. If used to stream video just over LAN Hawkeye will consume less than 5% of the CPU (assuming one MJPEG-capable webcam input). The Raspberry Pi lacks hardware accelerated encryption so using HTTPS will slow things down: the CPU usage per user will jump by about 10%.

## License

Hawkeye is licensed under GPL-3 unless specified differently in the source files. It also links to the OpenSSL library which adds its own restrictions. See COPYING for details.

## Credits

Much of the video capture code was borrowed and modified from the mjpeg-streamer project. The web UI is based on Bootstrap and jQuery. The rest was written from scratch by Igor Partola <igor@igorpartola.com> (https://igorpartola.com).

