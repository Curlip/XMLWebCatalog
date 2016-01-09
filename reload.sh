#!/bin/bash    

java -jar $1 catalog.xml splitter.xsl
java -jar $1 catalog.xml style.xsl -o:index.html

find d -name "*.xml" -exec bash -c 'java -jar $2 $1 d/style.xsl -o:"${1%.xml}.html"' _ {} $1 \;

find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \;

chmod a+x reload.sh
