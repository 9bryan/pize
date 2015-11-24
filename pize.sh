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
    
# read list and resource lines
echo '#!/bin/bash' > $outFile
cat > $outFile <<'EOF'
#
# Generated puppet code
#
EOF

while read i; do
  # resource each type referenced in the file.
  # also a good place to put some logic to copy a file resource to a module/files directory if it's smaller than maybe 100k
  puppet resource $i >> $outFile
  echo "" >> $outFile
done < $inputFile

# Lint --fix outFile, This should probably always be the last line.
puppet-lint $outFile --fix
