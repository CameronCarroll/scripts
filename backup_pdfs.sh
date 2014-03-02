#!/usr/bin/zsh
rsync -vr --include '*/' --include '*.pdf' --exclude '*' /home/cameron/docs/gcccd2/semester/. /home/cameron/docs/backup_school/semester_binaries
