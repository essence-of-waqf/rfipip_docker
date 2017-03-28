FROM kernsuite/base:dev

RUN docker-apt-install sigpyproc

RUN apt-get -y check && \
    apt-get -y update && \
    apt-get -y update --fix-missing && \
    apt-get -y upgrade

RUN apt-get -y install \
    libqt4-dbus \
    libqt4-declarative \
    libqt4-designer \
    libqt4-dev \
    libqt4-dev-bin \
    libqt4-help \
    libqt4-network \
    libqt4-opengl \
    libqt4-opengl-dev \
    libqt4-qt3support \
    libqt4-script \
    libqt4-scripttools \
    libqt4-sql \
    libqt4-sql-mysql \
    libqt4-svg \
    libqt4-test \
    libqt4-xml \
    libqt4-xmlpatterns \
    libqt4pas-dev \
    libqt4pas5 \
    python-tk

# update the system
RUN apt-get -y install wget

RUN pip install pip -U && \
    pip install numpy -U && \
    pip install scipy -U && \
    pip install pandas -U && \
    pip install h5py -U && \
    pip install astropy -U && \
    pip install matplotlib -U && \
    pip install seaborn -U && \
    pip install mpld3 -U && \
    pip install jinja2 -U && \
    pip install rfipip

# Downloading all source codes
RUN wget https://raw.githubusercontent.com/pinsleepe/pulsar_docker/master/scripts/rfi_cwl.py -P /home
WORKDIR /home
RUN chmod 755 rfi_cwl.py

