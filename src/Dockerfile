# FROM baseImage:tag // Where we’re going to start our image / What’s the foundation we’re gonna build on ?
# 'httpd' is the base image, here Apache http Server, and 'alpine' is the tag, ie the type/version of that image.
# the alpine tag changes over time, it will adapt to the latest version of that image. Conversely it can also be a fixed image, using a specific version number.
 
# COPY source dest // We make a copy from our root directory, here symbolised by dot slash './', '/usr/local/apache2/htdocs/' is the default web folder for apache web servers.

FROM nginx:alpine
COPY . /usr/share/nginx/html

EXPOSE 80

# FROM httpd:alpine
#COPY ./ /usr/local/apache2/htdocs/


