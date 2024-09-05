FROM registry.jetbrains.team/p/writerside/builder/writerside-builder:241.18775 as build

ARG INSTANCE=Writerside/pop2024

RUN mkdir /opt/sources

WORKDIR /opt/sources

ADD Writerside ./Writerside

RUN apt-get update && apt-get install -y x11vnc tree file

RUN export DISPLAY=:99 && \
Xvfb :99 & \
/opt/builder/bin/idea.sh helpbuilderinspect -source-dir /opt/sources --product $INSTANCE --runner other --output-dir /opt/wrs-output/

WORKDIR /opt/wrs-output

RUN unzip -O UTF-8 webHelpPOP20242-all.zip -d /opt/wrs-output/unzipped-artifact

FROM httpd:2.4 as http-server

COPY --from=build /opt/wrs-output/unzipped-artifact/ /usr/local/apache2/htdocs/

# #Second one

#FROM registry.jetbrains.team/p/writerside/builder/writerside-builder:241.18775 as build
#
#ARG INSTANCE=Writerside/pop2024
#
#RUN mkdir /opt/sources
#
#WORKDIR /opt/sources
#
#ADD Writerside ./Writerside
#
## Install additional debugging tools
#RUN apt-get update && apt-get install -y x11vnc tree file
#
## Start Xvfb and wait for it to be ready, then run the Writerside builder with more verbose output
#RUN export DISPLAY=:99 && \
#    Xvfb :99 -ac &\
#    while ! xdpyinfo -display :99 >/dev/null 2>&1; do sleep 0.1; done && \
#    x11vnc -display :99 -forever -nopw & \
#    echo "Running Writerside builder..." && \
#    /opt/builder/bin/idea.sh helpbuilderinspect -source-dir /opt/sources --product $INSTANCE --runner other --output-dir /opt/wrs-output/ -verbose 2>&1 | tee /opt/build.log && \
#    echo "Writerside builder finished."
#
#WORKDIR /opt/wrs-output
#
## Add extensive debugging steps
#RUN echo "Contents of /opt/sources:" && \
#    ls -la /opt/sources && \
#    echo "Contents of /opt/sources/Writerside:" && \
#    ls -la /opt/sources/Writerside && \
#    echo "Contents of /opt/wrs-output:" && \
#    ls -la /opt/wrs-output && \
#    echo "Directory structure of /opt/wrs-output:" && \
#    tree /opt/wrs-output && \
#    echo "Build log:" && \
#    cat /opt/build.log && \
#    echo "Environment variables:" && \
#    env
#
## Check for any files and provide information
#RUN echo "All files in /opt/wrs-output:" && \
#    find /opt/wrs-output -type f && \
#    echo "File types in /opt/wrs-output:" && \
#    find /opt/wrs-output -type f -exec file {} \;
#
## Attempt to unzip any zip file found, or create a dummy file if none exists
#RUN if ls *.zip 1> /dev/null 2>&1; then \
#        echo "Zip file(s) found. Unzipping..." && \
#        unzip -O UTF-8 -v *.zip -d /opt/wrs-output/unzipped-artifact; \
#    else \
#        echo "No zip files found. Creating a dummy file." && \
#        mkdir -p /opt/wrs-output/unzipped-artifact && \
#        echo "Dummy content" > /opt/wrs-output/unzipped-artifact/dummy.txt; \
#    fi
#
#FROM httpd:2.4 as http-server
#
#COPY --from=build /opt/wrs-output/unzipped-artifact/ /usr/local/apache2/htdocs/
#COPY --from=build /opt/build.log /usr/local/apache2/htdocs/build.log
#COPY --from=build /opt/wrs-output /usr/local/apache2/htdocs/wrs-output