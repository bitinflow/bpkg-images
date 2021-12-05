# bpkg.io Images

The bkg.io images are a collection of images that are used as a base for building other images. Mostly they are used as
base images for our web projects.

## Supported Images

| Image | Version | Description | Architecture | Supported |
| ------ | ------- | ----------- | ------------ | ---------- |
| bpkg.io/laravel | 8.0-octane | PHP image containing all extensions for a laravel octane app. | amd64, arm64 | yes |
| bpkg.io/laravel | 8.0-octane-develop | Development build. | amd64, arm64 | no |
| bpkg.io/laravel | 8.1-octane | PHP image containing all extensions for a laravel octane app. | amd64, arm64 | yes |
| bpkg.io/laravel | 8.1-octane-develop | Development build. | amd64, arm64 | no |
| bpkg.io/hello-world | latest | Development build. | amd64, arm64 | no |
| bpkg.io/hello-world | latest-develop | Development build. | amd64, arm64 | no |

## Concepts

### Default Working Directory

For web projects the default working directory is `/var/www/html`. This applies to all `bpkg.io/laravel` images.

## Usage

The following dockerfile show the usage of the bpkg.io/laravel image. Per default, it uses the
command `php artisan octane:start --host 0.0.0.0` to start the application and expose the application on port 8000.

```dockerfile
FROM bpkg.io/laravel:8.0-octane

# copy all your project files to the /var/www/html folder
COPY . /var/www/html
```