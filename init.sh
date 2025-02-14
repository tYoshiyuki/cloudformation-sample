#!/bin/bash
echo "----------- setting venv -----------"
py -3.12 -m venv .venv

echo "----------- activate venv -----------"
source .venv/Scripts/activate

echo "----------- pip install -----------"
pip install cfn-lint
