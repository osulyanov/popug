ARG RUBY_IMAGE_TYPE='ruby'

FROM $RUBY_IMAGE_TYPE:3.1.2-slim
ARG APP_HOME=/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
RUN apt-get update -qq \
  && apt-get install -qq -y --no-install-recommends build-essential libpq-dev libxml2-dev

ENV BUNDLE_PATH=/gems \
 BUNDLE_BIN=/gems/bin \
 GEM_HOME=/gems
ENV PATH /gems/bin:$PATH

COPY . $APP_HOME
