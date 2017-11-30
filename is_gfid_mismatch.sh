is_gfid_mismatch () 
{ 
    gfid=$(getfattr -n trusted.gfid -e hex "$1");
    grep -Fq ${gfid##*=0x} /dev/shm/gvhi && echo $1
}
declare -fx is_gfid_mismatch

