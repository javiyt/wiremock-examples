# Wiremock configuration examples
Examples on how to use Wiremock using json configuration files.

## How to run examples
First you need to run Wiremock instance, to do that just execute:
```
make run
```

Then execute the target you want to run from the Makefile
```
make hello
```

## Record mode
We want to record real API calls. Follow the method explained on [Wiremock documentation](http://wiremock.org/docs/record-playback/).

Start Wiremock
```
make run
```

Go to [http://localhost:8080/__admin/recorder](http://localhost:8080/__admin/recorder) and set up https://api.tfl.gov.uk as target URL. Make calls to TFL API changing TLF host for Wiremock host http://localhost:8080/

The output of the current recorded requests can be found on mappings folder.

And easier way to make the test can be running record target on Makefile
```
make record
```
