FROM microsoft/windowsservercore
ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));

WORKDIR /Python3
RUN cinst -y python
WORKDIR /code
COPY . .

RUN powershell -command "[Environment]::SetEnvironmentVariable('Path', $env:Path + ';/Python3/Scripts', [EnvironmentVariableTarget]::Machine)"

ENV PYTHONIOENCODING UTF-8

RUN python -m pip install --upgrade pip && \
    pip install aws-sam-cli

WORKDIR /functions


