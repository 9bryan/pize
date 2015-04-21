#
# ./pize.sh
# Author: Bryan Wood
# 
# Date:  4/20/15
#
# Summary:  Script to assist in the very initial puppetization of a system
#
#!/bin/bash

# Set input file:
if [ -z "$1" ]
  then
    inputFile='./pize.list' 
    echo "No input file specified, defaulting to ${inputFile}"
  else
    inputFile = $1
fi

# Set output file:
if [ -z "$2" ]
  then
    outFile='./pizeOut.pp'
    echo "No output file specified, defaulting to ${outFile}"
  else
    outFile = $2
fi
    
echo $inputFile
echo $outFile

echo '#!/bin/bash' > $outFile
cat > $outFile <<'EOF'
#
# Generated puppet code
#
EOF

while read i; do
  puppet resource $i >> $outFile
  echo "" >> $outFile
done < $inputFile
