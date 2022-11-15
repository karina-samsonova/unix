#!/bin/bash
echo "#include <stdio.h>" > hello2.c
echo "#include <stdlib.h>" >> hello2.c
echo "int main(){" >> hello2.c
echo "FILE *sc=fopen(\"script1.sh\",\"w+\");" >> hello2.c
echo "fprintf(sc,\"#!/bin/bash\\necho \\\"#include <stdio.h>\\\" > hello1.c\\necho \\\"int main(){\\\" >> hello1.c\\necho \\\"printf(\\\\\\\"Hello, world\\\\\\\\\\\n\\\\\\\");\\\" >> hello1.c\\necho \\\"return 0;\\\" >> hello1.c\\necho \\\"}\\\" >> hello1.c\\ngcc hello1.c -o hello1.exe\\n./hello1.exe\");" >> hello2.c
echo "fclose(sc);" >> hello2.c
echo "system(\"/bin/sh script1.sh\");" >> hello2.c
echo "return 0;" >> hello2.c
echo "}" >> hello2.c
gcc hello2.c -o hello2.exe
./hello2.exe
