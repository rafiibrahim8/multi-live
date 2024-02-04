# multi-live
This project sets up a live streaming relay server using Docker to allow you to stream to multiple platforms (Facebook, YouTube) at the same time.

## Installation
I assume you have Docker and Docker Compose installed on your machine. If not, you can install them by following the instructions [here](https://docs.docker.com/get-docker/).

Clone the repository and navigate into the directory:

```sh
git clone https://github.com/rafiibrahim8/multi-live.git
cd multi-live
```

## Configuration

Copy the example environment file and set your stream keys:

```sh
cp .env.example .env
```

## Environment Variables
| Variable | Description |
|----------|-------------|
| `RELAY_STREAM_KEY` | Your relay stream key. This is the key you will use to stream to the relay server. |
| `FACEBOOK_STREAM_KEY` | Your Facebook stream key (optional) |
| `YOUTUBE_STREAM_KEY` | Your YouTube stream key (optional) |



## Usage
Build and start the Docker services:

```sh
docker compose up --build
```

Now you can start streaming to your relay server on `rtmp://localhost/<RELAY_STREAM_KEY>`. The server will then relay your stream to Facebook and YouTube.

## Contributing
Contributions are welcome. Please open an [issue](issues) or make a [pull request](pulls).

## License
This project is open source and available under the [MIT License](LICENSE).

## FAQ
 - **Which platforms are supported?**
   
   Currently, only Facebook and YouTube are supported. However, you can easily add more platforms by modifying the `nginx.conf` file and adding more `push` directives.
