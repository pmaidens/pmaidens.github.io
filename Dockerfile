FROM jekyll/jekyll:3.8.6
COPY . /srv/jekyll
ENV DEBUG=true
RUN jekyll build
