if [ "$1" == "" ];then
        INSTALL_PATH=${PWD}/_install
else
        if [ -d $1 ]; then
                INSTALL_PATH=$1
        else
                exit 1
        fi
fi

if [ ! -d $INSTALL_PATH ]; then
        mkdir -p $INSTALL_PATH
fi

if [ -f config.log  ]; then
        make distclean
fi
./configure --prefix=$INSTALL_PATH \
                --disable-debug    \
                --disable-shared
#        --host=gcc
#       --build=i486
#        --disable-debug  \
#        --enable-optimise \
#        --disable-fvisibility \
#       --disable-gch \
#        --disable--largefile \
#        --disable--


if [ $? -eq 0 ]; then
        make
        if [ $? -eq 0 ]; then
                make install
                exit 0;
        fi

fi

~                                                                                                                                                                                                           
~                                                                                                                    
