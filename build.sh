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



#./configure --host=arm-linux-gnueabihf --build=x86_64 --target=arm-linux 
./configure  --host=arm-linux-gnueabihf --prefix=$INSTALL_PATH --disable-debug -disable-shared 

#                CC=gcc  \
#                CXX=g++
#       --build=i486
#                --host=arm-linux  \
#        --disable-debug  \
#        --enable-optimise \
#        --disable-fvisibility \
#       --disable-gch \
#        --disable--largefile \
#        --disable--
#				--build=i486-linux-gnu \

if [ $? -eq 0 ]; then
        make
        if [ $? -eq 0 ]; then
                make install
                exit 0;
        fi

fi

