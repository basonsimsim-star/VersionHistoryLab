# Version History Lab

A small SwiftUI teaching demo for exploring fictional app release histories and compatibility labels. It is designed for classroom discussion and runs entirely on local sample data.

## Safety and scope

This project does not access the App Store, retrieve app binaries, inspect device backups, install apps, modify installed apps, or downgrade software. The listed app and OS versions are invented examples. The demo is not affiliated with Apple.

## Build an unsigned demo IPA on GitHub

1. Add this folder to a GitHub repository.
2. Open **Actions** and run **Build educational demo IPA** using **Run workflow**.
3. Download the `version-history-lab-unsigned-ipa` artifact from the completed run.

The artifact is unsigned and intended for educational inspection. It is not ready to install on an iPhone. A signed build requires an Apple development team and signing credentials managed by the project owner.

## Build locally

On a Mac with Xcode and XcodeGen installed:

```sh
xcodegen generate
xcodebuild -project VersionHistoryLab.xcodeproj -scheme VersionHistoryLab -destination 'generic/platform=iOS' build
```
