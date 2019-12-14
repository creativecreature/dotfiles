#!/bin/bash

# Swedish for find
hitta() {
  rg -g '!tests/' -g '!test/' -g '!node_modules/' -g '!*.test.*' "$1"
}
