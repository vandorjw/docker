FROM selenium/node-firefox:3.10.0-argon
COPY ./entrypoint.sh /entrypoint.sh
RUN sudo chown seluser:seluser /entrypoint.sh
RUN sudo chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

