
#!/bin/bash

export LD_LIBRARY_PATH=/workspace/chromeremote/zribi/usr/lib/x86_64-linux-gnu
export PATH=$PATH:/workspace/chromeremote/zribi/usr/bin
export PERL5LIB==$PERL5LIB=:/workspace/chromeremote/zribi/usr/share/perl5:/usr/lib/x86_64-linux-gnu/perl5/5.34



#!/bin/bash

# Change to the directory containing your libraries and binaries

# Set the LD_LIBRARY_PATH to include your directory
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/lib:$(pwd)/lib/x86_64-linux-gnu/
# export PATH=$PATH:$(pwd)/bin
# export PERL5LIB=$(pwd)/share/perl5:$(pwd)/lib/x86_64-linux-gnu/perl5/5.34
# export GERARD=$(pwd)/robert
# export GERARD=$HOME


# Launch vncserver
kasmvncserver -prompt true -httpd /workspace/chromeremote/minld/www -rfbport 12000 -SecurityTypes None -xkbdir /workspace/chromeremote/zribi/usr/share/X11/xkb


# sudo apt-get install   libdatetime-perl  libtry-tiny-perl
# sudo ln -sf /workspace/chromeremote/zribi/usr/bin/Xkasmvnc /workspace/chromeremote/zribi/usr/bin/Xvnc
# sudo ln -sf /workspace/chromeremote/zribi/usr/bin/kasmvncpasswd /workspace/chromeremote/zribi/usr/bin/vncpasswd 
# sudo apt-get install fluxbox 
# fix default kasm_default.yaml path
# fix certs path
# comment ConfigureDeToRun();
# sudo apt-get install x11-xkb-utils  xkb-data install libgtk-3-0
# sudo apt-get install fluxbox chromium
# ungoogled chromium 

#makeself zribi  myapp_installer.sh "MyApp installer" ./zewz.sh

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl-cert-snakeoil.key -out ssl-cert-snakeoil.pem