function format_dir(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then
            format_dir $dir_or_file
        else
            file=$element
            if [ "${file##*.}"x = "h"x ] || [ "${file##*.}"x = "m"x ] || [ "${file##*.}"x = "mm"x ];then
                uncrustify  -c ~/.uncrustify_obj_c.cfg --no-backup -l OC $dir_or_file
            fi
        fi
    done
}