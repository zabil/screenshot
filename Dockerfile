FROM ubuntu

# Install Python.
RUN (apt-get update &&\
    apt-get install -y --no-install-recommends python3.7 python3-pip python3-setuptools &&\
    apt-get install -y --no-install-recommends gnupg2 &&\
    apt-get install -y --no-install-recommends wget &&\
    apt-get install -y --no-install-recommends unzip &&\
    rm -rf /var/lib/apt/lists/* &&\
                                ln -sf /usr/bin/python3 /usr/bin/python && \
                                ln -sf /usr/bin/pip3 /usr/bin/pip)

# Install Gauge
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
RUN echo deb https://dl.bintray.com/gauge/gauge-deb stable main | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install gauge

RUN apt-get update && apt-get install gauge

# Install gauge plugins
RUN gauge install python
RUN gauge install screenshot
RUN gauge install html-report
RUN gauge install xml-report
RUN gauge install spectacle

# Install selenium
RUN pip install selenium

ENV PATH=$HOME/.gauge:$PATH

RUN apt-get -y install chromium-chromedriver
RUN pip3 install getgauge
RUN pip3 install selenium
VOLUME /vowels
