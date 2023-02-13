def get_common_pkgs(box_name="ubuntu1804")
  common_pkgs = ""
  if ( box_name =~ /(fedora|centos|rhel|alma|rocky)(.*)/i )
    common_pkgs = 'vim emacs curl wget bash zsh csh ksh tmux gcc clang gdb cmake make automake python3'

  elsif ( box_name =~ /(debian|ubuntu|kali|zorin|mint|popos)(.*)/i ) 
    common_pkgs = 'vim emacs curl wget axel aria2 nano git openssh-server bash zsh fish csh tcsh ksh tmux ' +
      'gcc g++ clang gdb cmake make automake python3 python3-dev python3-pip python3-venv autojump'

  elsif ( box_name =~ /(arch|manjaro)(.*)/i ) 
    common_pkgs = 'git which base git wget nano curl dnsutils openssh net-tools inetutils ' +
      'traceroute zsh bash zsh fish tcsh ksh tmux vim neovim nano emacs ' +
      'gcc clang gdb cmake make automake python3'

  elsif ( box_name =~ /(opensuse)(.*)/i ) 
    common_pkgs = 'vim nano git bash zsh tmux fish tcsh ' +
      'gcc clang gdb cmake make automake python3'

  elsif ( box_name =~ /(alpine)(.*)/i ) 
    common_pkgs = 'shadow which git bash zsh tmux fish tcsh openssh-server net-tools vim nano neovim emacs ' +
      'curl wget fzf nnn ranger musl-locales musl-locales-lang ' +
      'gcc clang gdb cmake make automake python3'

  elsif ( box_name =~ /(geetoo)(.*)/i ) 
    common_pkgs = 'vim nano git bash zsh tmux fish tcsh'

  elsif ( box_name =~ /(nixos)(.*)/i ) 
    common_pkgs = 'vim nano git bash zsh tmux fish tcsh ' +
      'gcc clang gdb cmake make automake python3'

  elsif ( box_name =~ /(freebsd)(.*)/i ) 
    common_pkgs = 'vim nano git'

  elsif ( box_name =~ /(openbsd)(.*)/i ) 
    common_pkgs = 'vim nano git'

  elsif ( box_name =~ /(netbsd)(.*)/i ) 
    common_pkgs = 'vim nano git'

  elsif ( box_name =~ /(dragonflybsd)(.*)/i ) 
    common_pkgs = 'vim nano git'

  elsif ( box_name =~ /(hardenedbsd)(.*)/i ) 
    common_pkgs = 'vim nano git'

  elsif ( box_name =~ /(devuan)(.*)/i ) 
    common_pkgs = ""

  else
    puts "not supported!!!"

  end

  return common_pkgs
end

def get_pkg_mgt(box_name="ubuntu1804")
  pkg_mgt = ""
  if ( box_name =~ /(debian)(.*)/i )
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'cp /etc/apt/sources.list /etc/apt/sources.list.bak && ' +
      'sed -i "s/deb.debian.org/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && ' +
      'sed -i "s/security.debian.org/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && ' +
      'apt-get update && apt-get install -y '

  elsif ( box_name =~ /(ubuntu)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'cp /etc/apt/sources.list /etc/apt/sources.list.bak && ' +
      'sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && ' +
      'sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && ' +
      'apt-get update && apt-get install -y '

  elsif ( box_name =~ /(kali)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'cp /etc/apt/sources.list /etc/apt/sources.list.bak && ' +
      'echo "deb https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main non-free contrib" > /etc/apt/sources.list && ' +
      'apt-get update && apt-get install -y '

  elsif ( box_name =~ /(zorin|mint|popos)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'apt-get update && apt-get install -y '

  elsif ( box_name =~ /(fedora|centos|rhel|alma|rocky)(.*)/i )
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'yum update -y && yum install -y '

  elsif ( box_name =~ /(alpine)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'cp /etc/apk/repositories /etc/apk/repositories.bak && ' +
      'sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories && ' +
      'sed -i "s/mirrors.edge.kernel.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories && ' +
      'apk update && apk add --no-cache '

  elsif ( box_name =~ /(opensuse)[0-9]+(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'zypper mr -da && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/distribution/leap/\$releasever/repo/oss/" tuna-oss && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/distribution/leap/\$releasever/repo/non-oss/" tuna-non-oss && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/update/leap/\$releasever/oss/" tuna-update && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/update/leap/\$releasever/non-oss/" tuna-update-non-oss && ' +
      'zypper --gpg-auto-import-keys --non-interactive refresh && ' +
      'zypper --gpg-auto-import-keys --non-interactive update && ' +
      'zypper --gpg-auto-import-keys --non-interactive install --auto-agree-with-licenses '

  elsif ( box_name =~ /(opensuse-tumbleweed)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'zypper mr -da && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/oss/" tuna-oss && ' +
      'zypper ar -cfg "https://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/non-oss/" tuna-non-oss && ' +
      'zypper --gpg-auto-import-keys --non-interactive refresh && ' +
      'zypper --gpg-auto-import-keys --non-interactive update && ' +
      'zypper --gpg-auto-import-keys --non-interactive install --auto-agree-with-licenses '

  elsif ( box_name =~ /(arch)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'echo "Server = http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist && ' +
      'echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" >> /etc/pacman.d/mirrorlist && ' +
      'echo "" >> /etc/pacman.conf && ' +
      'echo "[archlinuxcn]" >> /etc/pacman.conf && ' +
      'echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf && ' +
      'pacman -Syyu && ' +
      'pacman -Syy --noprogressbar --noconfirm --needed '

  elsif ( box_name =~ /(manjaro)(.*)/i ) 
    pkg_mgt = 'export DEBIAN_FRONTEND=noninteractive && ' +
      'pacman -Syyu && ' +
      'pacman -Syy --noprogressbar --noconfirm --needed '

  elsif ( box_name =~ /(geetoo)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(freebsd)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(openbsd)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(netbsd)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(dragonflybsd)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(hardenedbsd)(.*)/i ) 
    pkg_mgt = ''

  elsif ( box_name =~ /(devuan)(.*)/i ) 
    pkg_mgt = ''

  else
    puts "not need any actions on pkg_mgt"

  end
  return pkg_mgt
end


box_list = [
  "rhel6","rhel7","rhel8","rhel9",
  "oracle6","oracle7","oracle8","oracle9",
  "alma8","alma9",
  "rocky8","oracle9",
  "centos6","centos7","centos8",
  "centos8s","centos9s",
  "fefora25","fefora26","fefora27","fefora28","fefora29","fefora30","fefora31","fefora32","fefora33","fefora34","fefora35","fefora36","fefora37",
  "debian8","debian9","debian10","debian11",
  "ubuntu1604","ubuntu1610","ubuntu1704","ubuntu1710","ubuntu1804","ubuntu1810","ubuntu1904","ubuntu1910","ubuntu2004","ubuntu2010","ubuntu2104","ubuntu2110","ubuntu2204","ubuntu2210",
  "alpine35","alpine36","alpine37","alpine38","alpine39","alpine310","alpine311","alpine312","alpine313","alpine314","alpine315","alpine316",
  "opensuse42","opensuse15",
  "freebsd11","freebsd12","freebsd13",
  "openbsd6","openbsd7",
  "netbsd8","netbsd9",
  "dragonflybsd5","dragonflybsd6",
  "hardenedbsd11","hardenedbsd12","hardenedbsd13",
  "devuan1","devuan2","devuan3","devuan4",
  "gentoo","arch",
]

box_url_map = {
  "ubuntu1404": {
    "box_name": "ubuntu-trusty",
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  },
  "ubuntu1604": {
    "box_name": "ubuntu-xenial",
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"
  },
  "ubuntu1804": {
    "box_name": "ubuntu-bionic",
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box"
  },
  "ubuntu2004": {
    "box_name": "ubuntu-focal",
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-vagrant.box"
  },
  "ubuntu2204": {
    "box_name": "ubuntu-jammy",
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/jammy/current/jammy-server-cloudimg-amd64-vagrant.box"
  },
  "centos7": {
    "box_name": "centos-7",
    "box_url": "https://mirrors.ustc.edu.cn/centos-cloud/centos/7/vagrant/x86_64/images/CentOS-7.box"
  }
}

# proxy_flag = true
proxy_flag = false

list = ["centos7","ubuntu1804"]
host_list = list.map { |x| {
  "box_hostname": "vagrant-#{x}",
  "box_name": proxy_flag ? (box_url_map.has_key?(x.to_sym) ? box_url_map[x.to_sym][:box_name] : "generic/#{x}") : "generic/#{x}",
  "box_url": proxy_flag ? (box_url_map.has_key?(x.to_sym) ? box_url_map[x.to_sym][:box_url] : "") : "",
  "box_version": "",
  "box_ip": "192.168.30.#{ list.index(x) + 100 }",
  "box_forwarded_port": [
      {:guest => "8000", :host => "#{ list.index(x) + 8000 }",:auto_correct => true},
      {:guest => "3306", :host => "#{ list.index(x) + 3306 }"},
      {:guest => "8500", :host => "#{ list.index(x) + 8500 }"},
      {:guest => "80", :host => "#{ list.index(x) + 8800 }",:auto_correct => true},
   ],
  "box_synced_folder": [
    {
     :local => '.', 
     :virtual => '/vagrant'
    },
    {
     :local => 'E:/code', 
     :virtual => '/code'
    }
  ],
  "box_cmd": get_pkg_mgt(x) + get_common_pkgs(x)
} }

# p host_list


none_generic_box_name_map = {
  "kali": "kalilinux/rolling",
  "opensuse-tumbleweed": "alvistack/opensuse-tumbleweed",
  "centos-7": "centos/7",
  "centos-8": "centos/8",
  "centos-stream-8": "centos/stream8",
  "trusty64": "ubuntu/trusty64",
  "trusty32": "ubuntu/trusty32",
  "xenial64": "ubuntu/xenial64",
  "xenial32": "ubuntu/xenial32",
  "bionic64": "ubuntu/bionic64",
  "focal64": "ubuntu/focal64",
  "jammy64": "ubuntu/jammy64",
  "lunar64": "ubuntu/lunar64",
  "kinetic64": "ubuntu/kinetic64"
}

# p none_generic_box_name_map.keys.include?("kali".to_sym)
# p none_generic_box_name_map[:kali]

proxy_flag = true
# proxy_flag = false
# 
common_pkgs = 'git vim emacs curl wget bash zsh csh ksh tmux gcc clang gdb cmake make automake python3 python3-pip python3-venv ruby perl'
all_box_map = {
  "rhel6": {"special_pkgs": "openssh"},
  "rhel7": {"special_pkgs": "openssh"},
  "rhel8": {"special_pkgs": "openssh"},
  "rhel9": {"special_pkgs": "openssh"},
  "oracle6": {"special_pkgs": "openssh"},
  "oracle7": {"special_pkgs": "openssh"},
  "oracle8": {"special_pkgs": "openssh"},
  "oracle9": {"special_pkgs": "openssh"},
  "alma8": {"special_pkgs": "openssh"},
  "alma9": {"special_pkgs": "openssh"},
  "rocky8": {"special_pkgs": "openssh"},
  "oracle9": {"special_pkgs": "openssh"},
  "centos6": {"special_pkgs": "openssh"},
  "centos7": {
    "special_pkgs": "openssh", 
    "box_url": proxy_flag ? "https://mirrors.ustc.edu.cn/centos-cloud/centos/7/vagrant/x86_64/images/CentOS-7.box" : "", 
    "box_name": proxy_flag ? "centos-7" : "generic/centos7" 
  },
  "centos8": {"special_pkgs": "openssh"},
  "centos8s": {"special_pkgs": "openssh"},
  "centos9s": {"special_pkgs": "openssh"},
  "fefora25": {"special_pkgs": "openssh"},
  "fefora26": {"special_pkgs": "openssh"},
  "fefora27": {"special_pkgs": "openssh"},
  "fefora28": {"special_pkgs": "openssh"},
  "fefora29": {"special_pkgs": "openssh"},
  "fefora30": {"special_pkgs": "openssh"},
  "fefora31": {"special_pkgs": "openssh"},
  "fefora32": {"special_pkgs": "openssh fish"},
  "fefora33": {"special_pkgs": "openssh fish"},
  "fefora34": {"special_pkgs": "openssh fish"},
  "fefora35": {"special_pkgs": "openssh fish"},
  "fefora36": {"special_pkgs": "openssh fish"},
  "fefora37": {"special_pkgs": "openssh fish"},
  "debian8": {"special_pkgs": "openssh-server"},
  "debian9": {"special_pkgs": "openssh-server"},
  "debian10": {"special_pkgs": "openssh-server fish"},
  "debian11": {"special_pkgs": "openssh-server fish"},
  "ubuntu1404": {
    "special_pkgs": "openssh-server", 
    "box_url": "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box", 
    "box_name": "ubuntu-trusty"
  },
  "ubuntu1604": {
    "special_pkgs": "openssh-server", 
    "box_url": proxy_flag ? "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/xenial/current/xenial-server-cloudimg-amd64-vagrant.box" : "", 
    "box_name": proxy_flag ? "ubuntu-xenial" : "generic/ubuntu1604" 
  },
  "ubuntu1610": {"special_pkgs": "openssh-server"},
  "ubuntu1704": {"special_pkgs": "openssh-server"},
  "ubuntu1710": {"special_pkgs": "openssh-server"},
  "ubuntu1804": {
    "special_pkgs": "openssh-server fish", 
    "box_url": proxy_flag ? "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/bionic/current/bionic-server-cloudimg-amd64-vagrant.box" : "", 
    "box_name": proxy_flag ? "ubuntu-bionic" : "generic/ubuntu1804" 
  },
  "ubuntu1810": {"special_pkgs": "openssh-server fish"},
  "ubuntu1904": {"special_pkgs": "openssh-server fish"},
  "ubuntu1910": {"special_pkgs": "openssh-server fish"},
  "ubuntu2004": {
    "special_pkgs": "openssh-server fish", 
    "box_url": proxy_flag ? "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64-vagrant.box" : "", 
    "box_name": proxy_flag ? "ubuntu-focal" : "generic/ubuntu2004" 
  },
  "ubuntu2010": {"special_pkgs": "openssh-server fish"},
  "ubuntu2104": {"special_pkgs": "openssh-server fish"},
  "ubuntu2110": {"special_pkgs": "openssh-server fish"},
  "ubuntu2204": {
    "special_pkgs": "openssh-server fish", 
    "box_url": proxy_flag ? "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/jammy/current/jammy-server-cloudimg-amd64-vagrant.box" : "", 
    "box_name": proxy_flag ? "ubuntu-jammy7" : "generic/ubuntu2204" 
  },
  "ubuntu2210": {"special_pkgs": "openssh-server fish"},
  "alpine35": {"special_pkgs": "openssh"},
  "alpine36": {"special_pkgs": "openssh"},
  "alpine37": {"special_pkgs": "openssh"},
  "alpine38": {"special_pkgs": "openssh"},
  "alpine39": {"special_pkgs": "openssh"},
  "alpine310": {"special_pkgs": "openssh"},
  "alpine311": {"special_pkgs": "openssh"},
  "alpine312": {"special_pkgs": "openssh"},
  "alpine313": {"special_pkgs": "openssh"},
  "alpine314": {"special_pkgs": "openssh fish"},
  "alpine315": {"special_pkgs": "openssh fish"},
  "alpine316": {"special_pkgs": "openssh fish"},
  "opensuse42": {"special_pkgs": "openssh"},
  "opensuse15": {"special_pkgs": "openssh fish"},
  "freebsd11": {"special_pkgs": "openssh"},
  "freebsd12": {"special_pkgs": "openssh"},
  "freebsd13": {"special_pkgs": "openssh"},
  "openbsd6": {"special_pkgs": "openssh"},
  "openbsd7": {"special_pkgs": "openssh"},
  "netbsd8": {"special_pkgs": "openssh"},
  "netbsd9": {"special_pkgs": "openssh"},
  "dragonflybsd5": {"special_pkgs": "openssh"},
  "dragonflybsd6": {"special_pkgs": "openssh"},
  "hardenedbsd11": {"special_pkgs": "openssh"},
  "hardenedbsd12": {"special_pkgs": "openssh"},
  "hardenedbsd13": {"special_pkgs": "openssh"},
  "devuan1": {"special_pkgs": "openssh"},
  "devuan2": {"special_pkgs": "openssh"},
  "devuan3": {"special_pkgs": "openssh"},
  "devuan4": {"special_pkgs": "openssh"},
  "gentoo": {"special_pkgs": "openssh"},
  "arch": {"special_pkgs": "openssh"},
  "kali": {"special_pkgs": "openssh", "box_name": "kalilinux/rolling"},
  "opensuse-tumbleweed": {"special_pkgs": "openssh fish", "box_name": "alvistack/opensuse-tumbleweed"},
  "centos-7": {"special_pkgs": "openssh", "box_name": "centos/7"},
  "centos-8": {"special_pkgs": "openssh", "box_name": "centos/7"},
  "centos-stream-8": {"special_pkgs": "openssh", "box_name": "centos/stream8"},
  "ubuntu-trusty64": {"special_pkgs": "openssh", "box_name": "ubuntu/trusty64"},
  "ubuntu-trusty32": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/trusty32"},
  "ubuntu-xenial64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/xenial64"},
  "ubuntu-xenial32": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/xenial32"},
  "ubuntu-bionic64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/bionic64"},
  "ubuntu-focal64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/focal64"},
  "ubuntu-jammy64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/jammy64"},
  "ubuntu-lunar64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/lunar64"},
  "ubuntu-kinetic64": {"special_pkgs": "openssh-server fish", "box_name": "ubuntu/kinetic64"},
  "clearlinux": {"special_pkgs": "openssh", "box_name": "AntonioMeireles/ClearLinux"},
  "windows2016": { "special_pkgs": "", "box_name": "StefanScherer/windows_2016" },
  "windows2019": { "special_pkgs": "", "box_name": "StefanScherer/windows_2019" },
  "windows2022": { "special_pkgs": "", "box_name": "StefanScherer/windows_2022" },
  "windows2016-docker": { "special_pkgs": "", "box_name": "StefanScherer/windows_2016_docker" },
  "windows2019-docker": { "special_pkgs": "", "box_name": "StefanScherer/windows_2019_docker" },
  "windows2022-docker": { "special_pkgs": "", "box_name": "StefanScherer/windows_2022_docker" },
  "windows10": { "special_pkgs": "", "box_name": "StefanScherer/windows_10" },
  "windows11": { "special_pkgs": "", "box_name": "StefanScherer/windows_11" },
}

p all_box_map[:kali].has_key?(:box_name)
