#!/bin/bash

lisgd -v \
-g "1,DLUR,BL,*,R,/usr/local/bin/lisgd_1diag_fromBL.sh" \
-g "1,URDL,BL,*,R,/usr/local/bin/lisgd_1diag_toBL.sh" \
-g "1,DRUL,TL,*,R,/usr/local/bin/lisgd_1diag_toTL.sh" \
-g "1,ULDR,TL,*,R,/usr/local/bin/lisgd_1diag_fromTL.sh" \
-g "1,URDL,TR,*,R,/usr/local/bin/lisgd_1diag_fromTR.sh" \
-g "1,DLUR,TR,*,R,/usr/local/bin/lisgd_1diag_toTR.sh" \
-g "1,DRUL,BR,*,R,/usr/local/bin/lisgd_1diag_fromBR.sh" \
-g "1,UD,T,*,R,/usr/local/bin/lisgd_1_fromT.sh" \
-g "1,DU,T,*,R,/usr/local/bin/lisgd_1_toT.sh" \
-g "1,LR,L,*,R,/usr/local/bin/lisgd_1_fromL.sh" \
-g "1,RL,R,*,R,/usr/local/bin/lisgd_1_fromR.sh" \
-g "1,RL,L,*,R,/usr/local/bin/lavalauncher_kill.sh" \
-g "1,DU,B,*,R,/usr/local/bin/lisgd_1_fromB.sh" \
-g "1,UD,B,*,R,/usr/local/bin/lisgd_1_toB.sh" \
-g "2,UD,N,*,R,/usr/local/bin/lisgd_2down_anywhere.sh" \
-g "2,DU,N,*,R,/usr/local/bin/lisgd_2up_anywhere.sh" \
-g "2,LR,N,*,R,/usr/local/bin/lisgd_2rightward_anywhere.sh" \
-g "2,RL,N,*,R,/usr/local/bin/lisgd_2leftward_anywhere.sh" \
-g "2,ULDR,TL,*,/usr/local/bin/lisgd_2diag_fromTL.sh" \
-g "1,ULDR,BR,*,R,/usr/local/bin/lisgd_1diag_toBR.sh" \
-g "3,UD,N,*,R,/usr/local/bin/lisgd_3down_anywhere.sh" \
&
