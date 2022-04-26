#!/bin/bash

echo "start installing"
echo "git pulling..."
git pull
git submodule update --init --recursive

ROOT_DIR=$(pwd)
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
if [ -d "${NVIM_CONFIG_DIR}" ] || [ -L "${NVIM_CONFIG_DIR}" ]; then
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
if [ -d "${VIM_CONFIG_DIR}" ] || [ -L "${VIM_CONFIG_DIR}" ]; then 
    echo "${VIM_CONFIG_DIR} exists, now delete it"
    rm -r "${VIM_CONFIG_DIR}"
fi
ln -s "${NVIM_CONFIG_DIR}" "${VIM_CONFIG_DIR}"


# try to add plugin manager
# add packer.lua to manage plugins
PACKER_FATHER_REPO="${HOME}/.local/share/nvim/site/pack/packer/start"
PACKER_REPO="${PACKER_FATHER_REPO}/packer.nvim"
if [ -d "${PACKER_REPO}" ]; then
    echo "${PACKER_REPO} exists, delete it;"
    rm -rf "${PACKER_REPO}"
fi

mkdir -p ${PACKER_FATHER_REPO}

ln -s "${REPO_NVIM_DIR}/plugins/packer.nvim" "${PACKER_REPO}"

# soft link the vim dir to the dotfile
echo "new config installed"

