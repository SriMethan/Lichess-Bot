FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .
COPY requirements.txt .

# If you want to run any other commands use "RUN" before.

RUN apt update > aptud.log && apt install -y wget python3 python3-pip p7zip-full > apti.log
RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/MEGA/Goi5.1.bin.7z" -O Goi5.1.bin.7z \
&& 7z e Goi5.1.bin.7z && rm Goi5.1.bin.7z

RUN wget --no-check-certificate -nv "https://github.com/RaviharaV-bot/sfbot/raw/main/stockfish_x64_modern" -O chess-engine \ 
#&& wget --no-check-certificate -nv "https://tests.stockfishchess.org/api/nn/nn-3475407dc199.nnue" -O nn-3475407dc199.nnue \


RUN chmod +x chess-engine
# Engine name is here ^^^^^^

CMD python3 lichess-bot.py -u
