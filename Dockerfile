
FROM python:3.8

ARG ARA_VERSION=1.5.8
ARG ARA_GIT_URL=https://github.com/ansible-community/ara

ENV ARA_PATH=/opt/ara
ENV ARA_BASE_DIR=/opt/ara-database
ENV GUNICORN_WORKERS=4

RUN git clone --quiet "${ARA_GIT_URL}" --depth 1 --branch "${ARA_VERSION}" "${ARA_PATH}"
RUN  mkdir $ARA_BASE_DIR

RUN pip install --upgrade pip && \
 pip install /opt/ara[server] && \
 pip install pymysql && \
 pip install passlib && \
 pip install gunicorn && \
 rm -rf /var/cache/apk/* && \
   rm -rf /opt/ara

ENV PATH=/opt/ara/venv/bin:$PATH



CMD /usr/local/bin/ara-manage migrate && gunicorn --workers=$GUNICORN_WORKERS  --bind "0.0.0.0:8000" ara.server.wsgi
