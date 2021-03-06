#!/bin/bash
cd external/toybox
git fetch https://android.googlesource.com/platform/external/toybox refs/changes/74/265074/1 && git cherry-pick FETCH_HEAD
git cherry-pick d3e8dd1bf56afc2277960472a46907d419e4b3da
git cherry-pick 1c028ca33dc059a9d8f18daafcd77b5950268f41
git cherry-pick cb49c305e3c78179b19d6f174ae73309544292b8
cd ../../hardware/qcom/audio
git revert --no-edit 66796eef5ebf71befa37b74f6507efae80d51ea0
git fetch https://android.googlesource.com/platform/hardware/qcom/audio refs/changes/91/294291/1 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/audio refs/changes/05/333605/1 && git cherry-pick FETCH_HEAD
cd ../bt
git revert --no-edit c7dc913784965e4ce705c2045f0a8b43fcd1db1c
cd ../display
git revert --no-edit 51b4299f42c61d3a919c8e86c38a85f40902226b
git revert --no-edit b7d1a389b00370fc9d2a7db1268ce26271ead7e2
git revert --no-edit f026d04dde743a0524235ae57e2ce8ac5364d44b
git revert --no-edit 3261eb2236252f9f2510c008fad451411a780b3b
git fetch https://android.googlesource.com/platform/hardware/qcom/display refs/changes/72/265072/1 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/display refs/changes/73/265073/1 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/display refs/changes/54/274454/1 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/display refs/changes/55/274455/1 && git cherry-pick FETCH_HEAD
cd ../gps
git revert --no-edit 53bf15aab71461f81e27e6f5176afcd1a29af7d4
git revert --no-edit 486ab751599b7f8b5a2f2711d22867ad54fdc79b
cd ../media
git revert --no-edit d2bfc978bc0988b3a5ca83b89fb0fa3c293f8e35
git revert --no-edit 0f135396264b689e5b2478fb0face281c1e0facc
git revert --no-edit 9e8b76d32ece15e79ebf4b02ede869d89807eec6
cd ../keymaster
git revert --no-edit 583ecf5ed2a4be0d05229b8c6726680c3836be8b
git fetch https://android.googlesource.com/platform/hardware/qcom/keymaster refs/changes/70/212570/5 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/keymaster refs/changes/80/212580/2 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/hardware/qcom/keymaster refs/changes/61/213261/1 && git cherry-pick FETCH_HEAD
cd ../../../system/core
git fetch https://android.googlesource.com/platform/system/core refs/changes/52/269652/1 && git cherry-pick FETCH_HEAD
git fetch https://android.googlesource.com/platform/system/core refs/changes/58/327458/1 && git cherry-pick FETCH_HEAD
cd ../../packages/apps/Nfc
git revert --no-edit 988c3fff5470a1de3a880bd07fa438cc47e283c8
cd ../Music
git cherry-pick 6036ce6127022880a3d9c99bd15db4c968f3e6a3
cd ../../../

