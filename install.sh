#!/bin/sh
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

#############################
# Linux Installation #
#############################

# Define the root directory to /home/container.
# We can only write in /home/container and /tmp in the container.
ROOTFS_DIR=/home/container

export PATH=$PATH:~/.local/usr/bin

PROOT_VERSION="5.3.0" # Some releases do not have static builds attached.

# Detect the machine architecture.
ARCH=$(uname -m)

# Check machine architecture to make sure it is supported.
# If not, we exit with a non-zero status code.
if [ "$ARCH" = "x86_64" ]; then
  ARCH_ALT=amd64
elif [ "$ARCH" = "aarch64" ]; then
  ARCH_ALT=arm64
else
  printf "Unsupported CPU architecture: ${ARCH}"
  exit 1
fi

# Download & decompress the Linux root file system if not already installed.
if [ ! -e "$ROOTFS_DIR/.installed" ]; then

  printf "\033c"
  echo "${GREEN}╭────────────────────────────────────────────────────────────────────────────────╮${NC}"
  echo "${GREEN}│                                                                                │${NC}"
  echo "${GREEN}│                             Pterodactyl VPS EGG                                │${NC}"
  echo "${GREEN}│                                                                                │${NC}"
  echo "${GREEN}│                           ${RED}© 2021 - 2024 ${PURPLE}ysdragon${GREEN}                               │${NC}"
  echo "${GREEN}│                                                                                │${NC}"
  echo "${GREEN}╰────────────────────────────────────────────────────────────────────────────────╯${NC}"
  echo "                                                                                               "
  echo "${YELLOW}Please choose your favorite distro                                               ${NC}"
  echo "                                                                                               "  
  echo "* [1] Debian                                                                                   "
  echo "* [2] Ubuntu                                                                                   "
  echo "* [3] Void Linux                                                                               "
  echo "* [4] Alpine Linux  (Edge)                                                                     "
  echo "* [5] CentOS                                                                                   "
  echo "* [6] Rocky Linux                                                                              "
  echo "* [7] Fedora                                                                                   "
  echo "* [8] AlmaLinux                                                                                "
  echo "* [9] Slackware Linux                                                                          "
  echo "* [10] Kali Linux                                                                              "
  echo "* [11] openSUSE                                                                                "
  echo "* [12] Gentoo Linux                                                                            "
  echo "* [13] Arch Linux                                                                              "
  echo "* [14] Devuan Linux                                                                            "
  echo "                                                                                               "
  echo "${YELLOW}Enter OS (1-14):                                                                 ${NC}"

  read -p "" input

  case $input in

    1)
      echo "${GREEN}Installing Debian...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/bookworm/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    2)
      echo "${GREEN}Installing Ubuntu...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/jammy/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    3)
      echo "${GREEN}Installing Void Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/voidlinux/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    4)
      echo "${GREEN}Installing Alpine Linux (Edge)...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/alpine/edge/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    5)
      echo "${GREEN}Installing CentOS...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/centos/9-Stream/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    6)
      echo "${GREEN}Installing Rocky Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/rockylinux/9/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    7)
      echo "${GREEN}Installing Fedora...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/fedora/39/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    8)
      echo "${GREEN}Installing AlmaLinux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/almalinux/9/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    9)
      echo "${GREEN}Installing Slackware...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/slackware/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;


    10)
      echo "${GREEN}Installing Kali Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/kali/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    11)
      echo "${GREEN}Installing OpenSUSE Leap...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/opensuse/15.5/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    12)
      echo "${GREEN}Installing Gentoo Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/gentoo/current/${ARCH_ALT}/systemd/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    13)
      echo "${GREEN}Installing Arch Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/archlinux/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"

      mkdir $ROOTFS_DIR/home/container/ -p

      # Fixing pacman
      sed -i '/^#RootDir/s/^#//' "$ROOTFS_DIR/etc/pacman.conf"
      sed -i 's|/var/lib/pacman/|/var/lib/pacman|' "$ROOTFS_DIR/etc/pacman.conf"
      sed -i '/^#DBPath/s/^#//' "$ROOTFS_DIR/etc/pacman.conf"
    ;;

    14)
      echo "${GREEN}Installing Devuan Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/devuan/daedalus/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;



    *)
      echo "${RED}Invalid selection. Exiting.${NC}"
      exit 1
    ;;
  esac
fi

################################
# Package Installation & Setup #
#################################

# Download run.sh
curl -Ls "https://raw.githubusercontent.com/ysdragon/Pterodactyl-VPS-Egg/main/run.sh" -o "$ROOTFS_DIR/home/container/run.sh"
# Make run.sh executable.
chmod +x "$ROOTFS_DIR/home/container/run.sh"

# Download static proot.
if [ ! -e "$ROOTFS_DIR/.installed" ]; then
    # Download the packages from their sources
    mkdir -p "$ROOTFS_DIR/usr/local/bin"
    curl -Ls "https://github.com/proot-me/proot/releases/download/v${PROOT_VERSION}/proot-v${PROOT_VERSION}-${ARCH}-static" -o "$ROOTFS_DIR/usr/local/bin/proot"
    # Make PRoot executable.
    chmod 755 "$ROOTFS_DIR/usr/local/bin/proot"
fi

# Clean-up after installation complete & finish up.
if [ ! -e "$ROOTFS_DIR/.installed" ]; then
    # Add DNS Resolver nameservers to resolv.conf.
    printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" > "${ROOTFS_DIR}/etc/resolv.conf"
    # Wipe the files we downloaded into /tmp previously.
    rm -rf $ROOTFS_DIR/rootfs.tar.xz /tmp/sbin
    # Create .installed to later check whether OS is installed.
    touch "$ROOTFS_DIR/.installed"
fi

###########################
# Start PRoot environment #
###########################

# Get primary port from vps.config
port=$(grep -oP 'port=\K\d+' "$ROOTFS_DIR/vps.config")

# This command starts PRoot and binds several important directories
# from the host file system to our special root file system.
"$ROOTFS_DIR/usr/local/bin/proot" \
--rootfs="${ROOTFS_DIR}" \
-0 -w "/root" -b /dev -b /sys -b /proc -b /etc/resolv.conf -p $port:$port --kill-on-exit \
/bin/sh "$ROOTFS_DIR/run.sh"