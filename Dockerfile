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
    python-tk \
    dvipng \
    texlive-latex-extra \
    texlive-fonts-recommended \
    git

# update the system
RUN apt-get -y install wget

RUN pip install pip -U && \
    pip install numpy==1.12.1  -U && \
    pip install scipy==0.19.0 -U && \
    pip install pandas==0.19.2 -U && \
    pip install h5py==2.7.0 -U && \
    pip install matplotlib==2.0.0 -U && \
    pip install scikit-image==0.13.0 -U && \
    pip install tables==3.4.2 -U && \
    pip install git+https://github.com/pinsleepe/rfipip.git@devel

# Downloading all source codes
RUN wget https://raw.githubusercontent.com/pinsleepe/rfi_cwl/devel/debug/rfi_cwl.py -P /home
RUN wget https://raw.githubusercontent.com/pinsleepe/rfi_cwl/devel/debug/RFI_Spectrum_Database.csv -P /home
WORKDIR /home
RUN chmod 755 rfi_cwl.py

