FROM ruby
RUN gem install twurl
RUN apt-get update && apt-get install -y curl jq
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
