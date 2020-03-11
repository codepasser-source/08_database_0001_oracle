
OWNERS="TPSC_TEST,TPSC_CX_TEST"

DMPFILE=./Backup/tpsc`date +%Y%m%d`.dmp
LOGFILE=./Backup/export`date +%Y%m%d`.log

su - oracle -c "exp tpsc_test/tpsc_test file=$DMPFILE owner=$OWNERS log=$LOGFILE statistics=none"
