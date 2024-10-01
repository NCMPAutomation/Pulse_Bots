#!/bin/bash
export DSJOB_URL=<CP4D CLUSTER URL>
export DSJOB_USER=<USER>
export DSJOB_PWD=<PASSWD>
cpdctl config user set CP4D-user --username $DSJOB_USER --password $DSJOB_PWD
cpdctl config profile set CP4D-profile --url $DSJOB_URL --user CP4D-user
cpdctl config profile use CP4D-profile



```
export CPD_PROFILE=<PROFILE-1>
cpdctl project list
cpdctl ....
export CPD_PROFILE=<PROFILE-2>
cpdctl project list
cpdctl ....
unset CPD_PROFILE <go back to default profile>
```