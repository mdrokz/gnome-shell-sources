#! /bin/bash

gs=/usr/lib/gnome-shell/libgnome-shell.so

for r in `gresource list $gs`; do
    x=$(grep -o "/"<<<"$r" | wc -l)
    
    z=$((x + 1))
    
    y=0

    if [ $x == 5 ]
     then
        y=$((z - 1))
     else
        y=$((z - 2))   
    fi

    f=$(echo $r | cut -d"/" -f$z)
    dir=$(echo $r | cut -d"/" -f$y)
    # echo $dir
    gresource extract $gs $r > ./$dir/$f
done