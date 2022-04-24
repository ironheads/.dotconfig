#!/bin/bash
echo "start installing"
VIMRC="${HOME}/.vimrc"
CONFIG_DIR="${HOME}/.config"
NVIM_CONFIG_DIR="${CONFIG_DIR}/nvim"
INIT_VIM="init.vim"
ROOT_DIR=$(pwd)
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


# soft link the vim dir to the dotfile
echo "new config installed"
