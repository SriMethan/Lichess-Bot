FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full
RUN cd engines
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z
RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Cerebellum3merge.bin/-/raw/master/Cerebellum3Merge.bin.7z" -O Cerebellum3Merge.bin.7z
Run 7z e Cerebellum3Merge.bin.7z
RUN rm Cerebellum3Merge.bin.7z
RUN cd ~
RUN apt install python3-pip
RUN pip install virtualenv
RUN apt install python3-venv
RUN python3 -m venv venv
RUN virtualenv venv -p python3
RUN source ./venv/bin/activate
RUN python3 -m pip install -r requirements.txt
RUN python3 lichess-bot.py -u