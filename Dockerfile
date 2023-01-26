FROM matejc/rf-novnc:Browser-0.0.1

USER pwuser

COPY ./requirements.txt /home/pwuser/requirements.txt

RUN python3 -m pip install --user -r /home/pwuser/requirements.txt

USER root