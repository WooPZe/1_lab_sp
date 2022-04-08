FROM debian

WORKDIR /app

COPY dma.sh /app/

RUN chmod u+x dma.sh

CMD ./dma.sh
