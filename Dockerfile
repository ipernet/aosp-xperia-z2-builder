FROM debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main contrib" >>  /etc/apt/sources.list && \
  DEBIAN_FRONTEND=noninteractive apt-get update -q --fix-missing && \
  apt-get -y update && \
  apt-get -y --force-yes upgrade && \
  apt-get -y --force-yes install -t jessie-backports openjdk-8-jdk && \
  apt-get -y --force-yes install \
	#Kernel
    git build-essential python bc lzop \
	# AOSP
	curl bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip && \
  # Cleaning
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

###
# Kernel build
###
WORKDIR /android

ENV CROSS_COMPILE=/android/arm-eabi-4.8/bin/arm-eabi-

###
# Notes: requires 20GB download, 100GB space disk
###

RUN git clone https://github.com/rcstar6696/kernel
#RUN git clone https://github.com/SonyAosp/kernel

WORKDIR kernel

RUN git checkout android-7.1

#ADD aosp_shinano_sirius_defconfig arch/arm/configs/

RUN make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE aosp_shinano_sirius_defconfig && \
    make ARCH=arm CROSS_COMPILE=$CROSS_COMPILE -j `nproc`

###
# AOSP bootimage
###

WORKDIR /android

RUN mkdir bin && \
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > bin/repo && \
	chmod a+x bin/repo

ENV PATH /android/bin:$PATH 

RUN repo init -u https://android.googlesource.com/platform/manifest -b android-7.1.1_r22

WORKDIR .repo

RUN git clone https://github.com/sonyxperiadev/local_manifests && cd local_manifests && git checkout n-mr1

WORKDIR /android

ADD deps/SW_binaries_for_Xperia_AOSP_M_MR1_v09.zip /android/

RUN unzip SW_binaries_for_Xperia_AOSP_M_MR1_v09.zip && rm SW_binaries_for_Xperia_AOSP_M_MR1_v09.zip

RUN repo sync

ADD deps/upstream-patches.sh /android/

RUN cp kernel/arch/arm/boot/zImage device/sony/sirius/kernel && \
    cp -rp kernel/arch/arm/boot/dts/*.dtb device/sony/sirius/dtbs/ && \

RUN chmod +x upstream-patches.sh && ./upstream-patches.sh && \
	source build/envsetup.sh && \
	lunch 28 && \
	make -j `nproc` bootimage
