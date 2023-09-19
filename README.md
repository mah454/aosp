
### Android Build Environment
**Note:** I only tested this container on android 9 . please test this container for other `AOSP` versions (9+) and send issues for me .

##### Usage 
Download your favorite AOSP from repository, then run this command :
```
docker run -it --rm --name=build-aosp -v path/to/aosp:/aosp -e COMPILE_JOB_COUNT=24 aosp-env:latest
```

[Asciinema](https://asciinema.org/a/HXoEZOaZiLgCEQVDEX5UMEM1C)



