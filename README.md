# project-template

```bash
git clone git@github.com:lgf-136/project-template.git
cd project-template
git submodule update --init
cd .vscode
git pull origin main
cd ..

git submodule add -b alpine git@github.com:lgf-136/.devcontainer.git


git submodule add git@github.com:lgf-136/.devcontainer.git
git submodule add git@github.com:lgf-136/.vscode.git
git submodule add git@github.com:lgf-136/packer.git

git remote add origin git@gitee.com:lgf1244/project-template.git
git remote add github  git@github.com:lgf-136/project-template.git
git push --set-upstream origin mainpa

git clone git@github.com:lgf-136/project-template.git
cd project-template
git submodule update --init
git submodule foreach git pull origin main

git remote add origin git@github.com:lgf-136/project-template.git
git remote add gitee git@gitee.com:lgf1244/project-template.git

```

# vagrant

```bash

# virtualbox 文件夹同步共享插件
vagrant plugin install vagrant-proxyconf
vagrant plugin install vagrant-parallels
vagrant plugin install vagrant-vbguest --plugin-version 0.21
vagrant plugin list

vagrant plugin install --plugin-clean-sources --plugin-source https://gems.ruby-china.com/ vagrant-disksize
vagrant plugin install --plugin-clean-sources --plugin-source https://gems.ruby-china.com/ vagrant-proxyconf
vagrant plugin install --plugin-clean-sources --plugin-source https://gems.ruby-china.com/ vagrant-vbguest



vagrant init generic/ubuntu2204


vagrant up
vagrant up --provision --provider=virtualbox --color
vagrant up --provision --provider=hyperv --color
vagrant reload --provision
vagrant halt
vagrant destroy -f
vagrant box add generic/ubuntu2204 --provider virtualbox
vagrant box add generic/ubuntu2204 --provider hyperv

vagrant init ubuntu/xenial64
vagrant box add https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/xenial/current/xenial-server-cloudimg-amd64-vagrant.box --name ubuntu/xenial64
vagrant up

ssh -p $(vagrant port --guest 22) vagrant@127.0.0.1

```

# pre-commit
https://pre-commit.com/#top_level-exclude

```bash

pip install pre-commit
pre-commit --version

pre-commit install
pre-commit run --all-files
pre-commit run --all-files check-yaml



```


熟练使用 vagrant (17)：解决 vagrant 下载很慢的问题： [https://www.junmajinlong.com/virtual/vagrant/vagrant_speedup/](https://www.junmajinlong.com/virtual/vagrant/vagrant_speedup/)

Vagrant 使用指南:[https://www.wenjiangs.com/article/clzu1sbu109q.html#:~:text=%E6%8C%87%E5%AE%9A%20provider%20%E5%89%8D%E9%9D%A2%E6%8F%90%E5%88%B0%E8%BF%87Vagrant%E6%94%AF%E6%8C%81%E5%A4%9A%E7%A7%8D%E8%99%9A%E6%8B%9F%E5%BC%95%E6%93%8E%E6%9D%A5%E8%BF%9B%E8%A1%8C%E8%99%9A%E6%8B%9F%E5%8C%96%EF%BC%8C%E6%88%91%E4%BB%AC%E5%8F%AF%E4%BB%A5%E9%80%9A%E8%BF%87%20--provider](https://www.wenjiangs.com/article/clzu1sbu109q.html#:~:text=%E6%8C%87%E5%AE%9A%20provider%20%E5%89%8D%E9%9D%A2%E6%8F%90%E5%88%B0%E8%BF%87Vagrant%E6%94%AF%E6%8C%81%E5%A4%9A%E7%A7%8D%E8%99%9A%E6%8B%9F%E5%BC%95%E6%93%8E%E6%9D%A5%E8%BF%9B%E8%A1%8C%E8%99%9A%E6%8B%9F%E5%8C%96%EF%BC%8C%E6%88%91%E4%BB%AC%E5%8F%AF%E4%BB%A5%E9%80%9A%E8%BF%87%20--provider),%E5%8F%82%E6%95%B0%E6%9D%A5%E6%8C%87%E5%AE%9A%E8%99%9A%E6%8B%9F%E5%BC%95%E6%93%8E%EF%BC%8C%E9%BB%98%E8%AE%A4%E4%B8%BA%20virtualbox%20%E6%AF%94%E5%A6%82%20generic%2Farch%20box%E6%9C%895%E7%A7%8Dprovider%E6%8F%90%E4%BE%9B%EF%BC%8C%E5%88%86%E5%88%AB%E6%97%B6virtualbox%2Cvmware_desktop%2Chyperv%2Clibvirt%2Cparallels.
