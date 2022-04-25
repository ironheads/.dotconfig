#!/bin/bash

ROOT_DIR=$(dirname $0)
echo "start installing"
echo "git pulling..."
echo "ROOT DIR is ${ROOT_DIR}"
cd "${ROOT_DIR}"
git pull
git submodule update --init --recursive


VIMRC="${HOME}/.vimrc"
CONFIG_DIR="${HOME}/.config"
NVIM_CONFIG_DIR="${CONFIG_DIR}/nvim"
VIM_CONFIG_DIR="${HOME}/.vim"
INIT_VIM="init.vim"
REPO_NVIM_DIR="${ROOT_DIR}/nvim"
# link init.vim
if [ ! -d "${CONFIG_DIR}" ]; then
    echo "${CONFIG_DIR} does not exist, now create one"
    mkdir "${CONFIG_DIR}"
fi
if [ -d "${NVIM_CONFIG_DIR}" ]; then
    echo "${NVIM_CONFIG_DIR} exists, now delete it"
    rm -r "${NVIM_CONFIG_DIR}"
fi

ln -s "${REPO_NVIM_DIR}" "${NVIM_CONFIG_DIR}"

# link vimrc
if [ -f "${VIMRC}" ] || [ -L "${VIMRC}" ]; then
    echo "${VIMRC} exists, now delete it"
    rm "${VIMRC}"
fi

ln -s "${NVIM_CONFIG_DIR}/${INIT_VIM}" "${VIMRC}"

# link .vim directory
if [ -d "${VIM_CONFIG_DIR}" ]; then 
    echo "${VIM_CONFIG_DIR} exists, now delete it"
    rm -r "${VIM_CONFIG_DIR}"
fi
ln -s "${NVIM_CONFIG_DIR}" "${VIM_CONFIG_DIR}"


# try to add plugin manager
# add packer.lua to manage plugins
PACKER_REPO="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ -d "${PACKER_REPO}" ]; then
    echo "${PACKER_REPO} exists, delete it;"
    rm "${PACKER_REPO}"
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim "${PACKER_REPO}"


# soft link the vim dir to the dotfile
echo "new config installed"
