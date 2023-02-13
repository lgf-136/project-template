# -*- mode: ruby -*-
# vi: set ft=ruby :


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



proxy_flag = true
# proxy_flag = false
# 
common_pkgs = 'git vim emacs curl wget bash zsh csh ksh tmux gcc clang gdb cmake make automake python3 python3-pip python3-venv ruby perl'
rhel_like_common_pkgs = 'epel-release tree psmisc vim zsh tmux'
fedora_like_common_pkgs = 'epel-release tree psmisc vim zsh tmux'
debian_like_common_pkgs = ''
alpine_like_common_pkgs = ''
suse_like_common_pkgs = ''
nixos_like_common_pkgs = ''

all_box_map = {
  "rhel6": {"special_pkgs": "openssh "},
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
  "centos-6": {"special_pkgs": "openssh", "box_name": "centos/6"},
  "centos-7": {"special_pkgs": "openssh", "box_name": "centos/7"},
  "centos-8": {"special_pkgs": "openssh", "box_name": "centos/8"},
  "almalinux-8": {"special_pkgs": "openssh", "box_name": "almalinux/8"},
  "almalinux-9": {"special_pkgs": "openssh", "box_name": "almalinux/9"},
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
  "windows2016": {"special_pkgs": "", "box_name": "StefanScherer/windows_2016" },
  "windows2019": {"special_pkgs": "", "box_name": "StefanScherer/windows_2019" },
  "windows2022": {"special_pkgs": "", "box_name": "StefanScherer/windows_2022" },
  "windows2016-docker": {"special_pkgs": "", "box_name": "StefanScherer/windows_2016_docker" },
  "windows2019-docker": {"special_pkgs": "", "box_name": "StefanScherer/windows_2019_docker" },
  "windows2022-docker": {"special_pkgs": "", "box_name": "StefanScherer/windows_2022_docker" },
  "win10": {"special_pkgs": "", "box_name": "StefanScherer/windows_10" },
  "win11": {"special_pkgs": "", "box_name": "StefanScherer/windows_11" },
  "xp": {"special_pkgs": "", "box_name": "dvgamerr/win-xp-sp3" },
  "win7": {"special_pkgs": "", "box_name": "vladistan/win7" },
  "win8": {"special_pkgs": "", "box_name": "nunezruj/Base_Win8" },
  "win81": {"special_pkgs": "", "box_name": "breeze/win81-ie11" },
  "oracle11g": {"special_pkgs": "openssh", "box_name": "luciferliu/oracle11g"},

}




list = ["ubuntu2004"]
host_list = list.map { |x| {
  "box_hostname": "vagrant-#{x}",
  "box_name": all_box_map[x.to_sym].has_key?(:box_name) ? all_box_map[x.to_sym][:box_name] : "generic/#{x}",
  "box_url": all_box_map[x.to_sym].has_key?(:box_url) ? all_box_map[x.to_sym][:box_url] : "",
  "box_version": "",
  "box_ip": "192.168.30.#{ list.index(x) + 100 }",
  "box_forwarded_port": [
    {:guest => "8000", :host => "#{ list.index(x) + 8000 }",:auto_correct => true},
    {:guest => "3306", :host => "#{ list.index(x) + 3306 }"},
    {:guest => "8500", :host => "#{ list.index(x) + 8500 }"},
    {:guest => "80", :host => "#{ list.index(x) + 8800 }",:auto_correct => true},
   ],
  "box_synced_folder": [
    {:local => '.', :virtual => '/vagrant'},
    {:local => 'E:/code', :virtual => '/code'},
  ],
  "box_cmd": get_pkg_mgt(x) + all_box_map[x.to_sym][:special_pkgs]
} }

Vagrant.configure("2") do |config|

  config.vbguest.iso_path = "https://mirrors.tuna.tsinghua.edu.cn/virtualbox/%{version}/VBoxGuestAdditions_%{version}.iso"

  config.vm.box_check_update = true
  # config.vm.boot_timeout = 1800
  config.ssh.insert_key = false

  config.vm.provider :hyperv do |v, override|
    v.maxmemory = 2048
    v.memory = 2048
    v.cpus = 2
    # v.gui = false # The following settings shouldn't exist: gui
    # override.vm.synced_folder ".", "/vagrant", type: "smb"
  end

  config.vm.provider :virtualbox do |v, override|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--vram", 256]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.gui = false
    # override.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  end

  ["vmware_fusion", "vmware_workstation", "vmware_desktop"].each do |provider|
    config.vm.provider provider do |v, override|
      v.whitelist_verified = true
      v.gui = false
      v.vmx["cpuid.coresPerSocket"] = "1"
      v.vmx["memsize"] = "2048"
      v.vmx["numvcpus"] = "2"
    end
  end

  config.vm.provider :libvirt do |v, override|
    v.disk_bus = "virtio"
    v.driver = "kvm"
    v.video_vram = 256
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provider :parallels do |v, override|
    v.customize ["set", :id, "--on-window-close", "keep-running"]
    v.customize ["set", :id, "--startup-view", "headless"]
    v.customize ["set", :id, "--memsize", "2048"]
    v.customize ["set", :id, "--cpus", "2"]
  end


  host_list.each do |item|
    config.vm.define item[:box_hostname] do |host|
      host.vm.box = item[:box_name]
      host.vm.hostname = item[:box_hostname]
      if (item.has_key?(:box_forwarded_port) && !(item[:box_forwarded_port].empty?))
        item[:box_forwarded_port].each do |port|
          if port[:auto_correct]
              host.vm.network "forwarded_port", guest: port[:guest], host: port[:host], auto_correct:port[:auto_correct]
          else
              host.vm.network "forwarded_port", guest: port[:guest], host: port[:host]
          end
        end
      end
      if (item.has_key?(:box_synced_folder) && !(item[:box_synced_folder].empty?))
        item[:box_synced_folder].each do |folder|
          host.vm.synced_folder folder[:local], folder[:virtual]
        end
      end
      if (item.has_key?(:box_ip) && !(item[:box_ip].capitalize.empty?))
        host.vm.network "private_network", ip: item[:box_ip]
      end
      if (item.has_key?(:box_url) && !(item[:box_url].capitalize.empty?))
        host.vm.box_url = item[:box_url]
      end
      if (item.has_key?(:box_version) && !(item[:box_version].capitalize.empty?))
        host.vm.box_version = item[:box_version]
      end
      if (item.has_key?(:box_cmd) && !(item[:box_cmd].capitalize.empty?))
        host.vm.provision "shell", inline: <<-SHELL
            #{item[:box_cmd]}
            # chsh -s /bin/zsh
            usermod --shell /bin/zsh vagrant
            echo root:root|chpasswd && usermod --shell /bin/zsh root
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
            curl https://gitee.com/lgf1244/scripts/raw/main/shell/vagrant-system-init.sh | bash
            su -c "curl https://gitee.com/lgf1244/scripts/raw/main/shell/vagrant-system-init.sh | bash" vagrant
            cat /home/vagrant/.ssh/authorized_keys
          SHELL
      end
      
    end
  end
end

