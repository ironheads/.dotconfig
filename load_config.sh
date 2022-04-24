#!/bin/bash
echo "start installing"
VIMRC="${HOME}/.vimrc"
CONFIG_DIR="${HOME}/.config"
NVIM_CONFIG_DIR="${CONFIG_DIR}/nvim"
INIT_VIM="init.vim"
ROOT_DIR=$(pwd)
# link vimrc
if test -f "${VIMRC}"; then 
    echo "$VIMRC exists, now delete it"
    rm "$VIMRC"
fi
ln -s "${ROOT_DIR}/${INIT_VIM}" "$VIMRC"

# link init.vim
if [ ! -d "${CONFIG_DIR}" ]; then
    echo "${CONFIG_DIR} does not exist, now create one"
    mkdir "${CONFIG_DIR}"
fi
if [ ! -d "${NVIM_CONFIG_DIR}" ]; then
    echo "${NVIM_CONFIG_DIR} does not exist, now create one"
    mkdir "${NVIM_CONFIG_DIR}"
fi
if [ -f "${NVIM_CONFIG_DIR}/${INIT_VIM}" ]; then
    echo "${NVIM_CONFIG_DIR}/${INIT_VIM} exists, now delete it"
    rm "${NVIM_CONFIG_DIR}/${INIT_VIM}"
fi
ln -s "${VIMRC}" "${NVIM_CONFIG_DIR}/${INIT_VIM}"

echo "new config installed"
