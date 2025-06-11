# FROM baseImage:tag // Where we’re going to start our image / What’s the foundation we’re gonna build on ?
# 'httpd' is the base image, here Apache http Server, and 'alpine' is the tag, ie the type/version of that image.
# the alpine tag changes over time, it will adapt to the latest version of that image. Conversely it can also be a fixed image, using a specific version number.
 
# COPY source dest // We make a copy from our root directory, here symbolised by dot slash './', '/usr/local/apache2/htdocs/' is the default web folder for apache web servers.

FROM nginx:alpine
# FROM httpd:alpine

# Set the working directory inside the image to /app (or /usr/src/app).
# Avoids polluting the root directory '/' with application files, which is considered bad practice.
# Docker creates a working directory inside the alpine container file system, any subsequent commands (COPY, RUN, etc.) will use /app as the current working directory.
# WORKDIR /app

#COPY . .
COPY /src/ /usr/share/nginx/html
#COPY ./ /usr/local/apache2/htdocs/

# RUN npm install
# Typically used when deploying a JavaScript web application (like one built with React, Vue, Angular, etc.) using Node.js and npm to build the frontend assets before serving them with Nginx.
# Example: Installs tools like Webpack, Babel, or frameworks like React/Vue.
# This installs all the project's dependencies listed in package.json.
# Downloads and installs packages to the node_modules folder.
# These packages are required to build (and maybe run) your web app.

# RUN npm run build
# This runs the build script defined in your package.json. Usually something like:
# It compiles/transpiles your frontend source code (src/) into static assets (HTML, CSS, JS).
# Outputs a folder like dist/ or build/. This is what Nginx will serve!

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# nginx = run the NGINX web server | -g = pass a configuration command inline
# | "daemon off;" = keeps NGINX running in the foreground, allowing Docker to keep the container alive. Tells NGINX not to run in the background (i.e., not as a daemon)
# Normally, NGINX runs as a daemon — it goes into the background and runs silently. 
# But in Docker, the main process must stay in the foreground, or the container will exit immediately (because Docker thinks it's done).
# It's a best practice for containers — especially for simple services like static sites.



