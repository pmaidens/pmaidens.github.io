FROM jekyll/jekyll:3.8.6
COPY . /srv/jekyll
ENV DEBUG=true
ENV JEKYLL_ENV=development
RUN jekyll build
