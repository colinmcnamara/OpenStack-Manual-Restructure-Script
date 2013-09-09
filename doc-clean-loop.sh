#!/bin/bash
OLD="\/doc\/src\/docbkx"
OLD2="\/master\/doc\/src\/docbkx\/openstack-ops\/src"
NEW="\/doc"
NEW2="\/doc\/openstack-ops"
DPATH="*.xml"
BPATH="backup"
TFILE="out.tmp.$$"
[ ! -d $BPATH ] && mkdir -p $BPATH || :
for f in $DPATH
do
  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH
   sed "s/$OLD/$NEW/g" "$f" > $TFILE && mv $TFILE "$f"
  else
   echo "Error: Cannot read $f"
  fi

  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH
   sed "s/$OLD2/$NEW2/g" "$f" > $TFILE && mv $TFILE "$f"
  else
   echo "Error: Cannot read $f"
  fi
  rm -rf *.bak
done
#/bin/rm $TFILE