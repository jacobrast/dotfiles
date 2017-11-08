alias gv="sudo gvim"
alias p="python3"
alias al="cd ~/Documents/python/cv-alarm; workon alarm"
alias fftest="ffmpeg -i rtsp://184.72.239.149/vod/mp4:BigBuckBunny_115k.mov -f image2pipe -pix_fmt bgr24 -r 1 - | cat"
alias cv="cd ~/Documents/cpp/cv"
alias pdf="evince"
alias mosx="sudo mount -t hfsplus -o force,rw /dev/sda2 /media/osx"
findroot() {
    sudo find / -name "$1"
}
pybind() {
    c++ -O3 -Wall -shared -std=c++11 -fPIC `python3 -m pybind11 --includes` $1 -o ${1%.cpp}.so
}

