#!/bin/bash


# Adds support for newer versions of Mac OSX that do not support the \e
# escape sequence
if [ "$(uname)" == "Darwin" ]; then
  __ESCAPESEQ="\x1b"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  __ESCAPESEQ="\e"
fi

# -- COLORS -----------------------------------------------------------------------
function __colortext()
{
  echo -e " $__ESCAPESEQ[$2m$1$__ESCAPESEQ[0m"
}

function echogreen()
{
  echo $(__colortext "$1" "32")
}

function echored()
{
  echo $(__colortext "$1" "31")
}

function echoblue()
{
  echo $(__colortext "$1" "34")
}

function echopurple()
{
  echo $(__colortext "$1" "35")
}

function echoyellow()
{
  echo $(__colortext "$1" "33")
}

function echocyan()
{
  echo $(__colortext "$1" "36")
}


# -- HELPERS -----------------------------------------------------------------------
exists() {
  type "$1" >/dev/null 2>/dev/null
}

echo_header() {
  echo "     === $1 ==="
}

echo_item() {
  if [ "$2" == "green" ]; then
    echogreen "---> $1"
  elif [ "$2" == "red" ]; then
    echored "---> $1"
  else
    echo "---> $1"
  fi
}

get_boolean_response() {
  while true; do
    read -p "$1 (Y/N) " yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer yes or no";;
    esac
  done
}

system_is_OSX() {
  if [ "$(uname)" == "Darwin" ]; then
    return 0
  else
    return 1
  fi
}

system_is_linux() {
  if [ "$(expr $(uname -s) : '\(Linux\)')" ]; then
    return 0
  else
    return 1
  fi
}
