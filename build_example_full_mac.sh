#!/bin/bash

VST_NAME=Synth

sudo rm -rf "$VST_NAME.vst"
sudo rm -rf "/Library/Audio/Plug-Ins/VST/$VST_NAME.vst"
cargo build --example=synth --release
sudo ./bundle_example_mac.sh
sudo cp -R "$VST_NAME.vst" /Library/Audio/Plug-Ins/VST
