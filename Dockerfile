FROM redis/redis-stack-server:7.4.0-v0 AS redisstackserver
FROM bitnami/redis:7.4.0

### My customization
RUN mkdir /opt/bitnami/redis/modules
COPY --from=redisstackserver /opt/redis-stack/lib/redisearch.so /opt/bitnami/redis/modules
COPY --from=redisstackserver /opt/redis-stack/lib/rejson.so /opt/bitnami/redis/modules

### End of
EXPOSE 6379
USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/redis/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/redis/run.sh" ]