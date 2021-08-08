#!/bin/bash

# Modified lightly from
# https://github.com/RustAudio/vst-rs/blob/master/osx_vst_bundler.sh

VST_NAME=Synth
BUILD_OUTPUT=target/release/examples/libsynth.dylib

# Make the bundle folder
mkdir -p "$VST_NAME.vst/Contents/MacOS"

# Create the PkgInfo
echo "BNDL????" > "$VST_NAME.vst/Contents/PkgInfo"

# Build the Info.Plist
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>English</string>

    <key>CFBundleExecutable</key>
    <string>$VST_NAME</string>

    <key>CFBundleGetInfoString</key>
    <string>vst</string>

    <key>CFBundleIconFile</key>
    <string></string>

    <key>CFBundleIdentifier</key>
    <string>com.example.$VST_NAME</string>

    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>

    <key>CFBundleName</key>
    <string>$VST_NAME</string>

    <key>CFBundlePackageType</key>
    <string>BNDL</string>

    <key>CFBundleVersion</key>
    <string>1.0</string>

    <key>CFBundleSignature</key>
    <string>$((RANDOM % 9999))</string>

    <key>CSResourcesFileMapped</key>
    <string></string>

</dict>
</plist>" > "$VST_NAME.vst/Contents/Info.plist"

# Move the provided library to the correct location
cp "$BUILD_OUTPUT" "$VST_NAME.vst/Contents/MacOS/$VST_NAME"

echo "Created bundle $VST_NAME.vst"
