
copyofmmu0		equ	$B000
copyofmmu1		equ	$B001
copyofmmu2		equ	$B002
copyofmmu3		equ	$B003
gotcontext		equ	$B004
__savepearlmmu		equ	$B005
__saveaf		equ	$B006
__savehl		equ	$B008
saveaf			equ	$B00A
savebc			equ	$B00C
savede			equ	$B00E
savehl			equ	$B010
saveix			equ	$B012
saveiy			equ	$B014
savepc			equ	$B016
savesp			equ	$B018
saveafdash		equ	$B01A
savebcdash		equ	$B01C
savededash		equ	$B01E
savehldash		equ	$B020
savemmu0		equ	$B022
savemmu1		equ	$B023
savemmu2		equ	$B024
savemmu3		equ	$B025
savecritpc		equ	$B026
savecritsp		equ	$B028
savingcontext		equ	$B02A
nmimagic		equ	$B02B
nmichksums		equ	$B02F
criticalpc		equ	$B037
criticalsp		equ	$B039
initstack		equ	$B08B
diagnostics		equ	$B08B
saveprinstat		equ	$B08C
kbdstate1		equ	$B08D
kbdstate2		equ	$B097
padkeybuf		equ	$B0A1
padnextin		equ	$B0E1
padnextout		equ	$B0E2
padbufempty		equ	$B0E3
lastkbdstate		equ	$B0E4
thiskbdstate		equ	$B0E6
caps_state		equ	$B0E8
savecaps		equ	$B0E9
justswitchedon		equ	$B0EA
padserbuf		equ	$B0EB
padsernextin		equ	$B10B
padsernextout		equ	$B10C
padserbufempty		equ	$B10D
padserin_xoff		equ	$B10E
padserout_xoff		equ	$B10F
disablexonxoff		equ	$B110
ackirq			equ	$B111
rptdelay		equ	$B112
rptrate			equ	$B113
rpttimer		equ	$B114
keytorepeat		equ	$B115
rptkeystates		equ	$B116
rtcbuf			equ	$B117
d_alarmday		equ	$B124
alarmhappened		equ	$B12A
alarmhappenedgotmsg	equ	$B12B
soundcounter		equ	$B12C
soundptr		equ	$B12D
soundrepcount		equ	$B12F
soundrepptr		equ	$B130
poweroffminutes		equ	$B132
minutesleft		equ	$B133
minutecounter		equ	$B134
eventhappened		equ	$B136
preservecontext		equ	$B137
dontpreservecontext	equ	$B138
mainprog		equ	$B139
currentprinter		equ	$B13A
currentmenu		equ	$B13B
wasmenusel		equ	$B13D
lastsecond		equ	$B13E
clockon			equ	$B13F
sdumpname		equ	$B140
d_workspace		equ	$B148
d_datebuf		equ	$B150
d_asciitime		equ	$B162
currentcfg		equ	$B16E
g_outstream		equ	$B1BA
g_h_outfile		equ	$B1BB
g_pos			equ	$B1BD
def_fname		equ	$B1CE
def_first		equ	$B1DD
d_findinfobuf		equ	$B1DE
d_thisstream		equ	$B202
d_colrow		equ	$B202
d_row			equ	$B202
d_col			equ	$B203
d_winlefttop		equ	$B204
d_wintop		equ	$B204
d_winleft		equ	$B205
d_winsize		equ	$B206
d_winheight		equ	$B206
d_winwidth		equ	$B207
d_winset		equ	$B208
d_state			equ	$B209
d_colrowcount		equ	$B20A
d_rowcount		equ	$B20A
d_colcount		equ	$B20B
d_stream		equ	$B20C
d_fastpos		equ	$B20D
d_streamwsp		equ	$B20F
d_dateptr		equ	$B24F
d_kmcharret		equ	$B251
d_kstate		equ	$B253
d_caslocks		equ	$B255
d_sticky		equ	$B256
d_yellow		equ	$B257
d_calcmode		equ	$B258
d_kmexplen		equ	$B259
d_kmexpptr		equ	$B25A
d_expbuffer		equ	$B25C
d_expbufptr		equ	$B25E
d_expbufend		equ	$B260
macro_buf		equ	$B2A1
fs_clicat		equ	$B3A7
fs_showsizes		equ	$B3A8
fs_showsys		equ	$B3A9
fs_curfile		equ	$B3AA
fs_topleftfile		equ	$B3AB
fs_numcols		equ	$B3AC
fs_colwidth		equ	$B3AD
fs_numshown		equ	$B3AE
fs_maxfiles		equ	$B3AF
fs_handle		equ	$B3B0
fs_numfilerows		equ	$B3B2
fs_startlist		equ	$B3B3
fs_startdir		equ	$B3B5
fs_endlist		equ	$B3B7
fs_numfiles		equ	$B3B9
fs_lastshown		equ	$B3BA
tickcount		equ	$B3BB
ticksleftuntilevent	equ	$B3BF
tickreloadvalue		equ	$B3C1
tickeventpending	equ	$B3C3
countdowntimer		equ	$B3C4
savestream		equ	$B3C6
password		equ	$B3C7
pwbuf			equ	$B3CC
realpwbuf		equ	$B3D1
haspassword		equ	$B3D6
passwdlen		equ	$B3D7
passwordlocked		equ	$B3D8
editingsecret		equ	$B3D9
inmenu			equ	$B3DA
macro_count		equ	$B3DB
recording		equ	$B3DC
macro_token		equ	$B3DD
printfailed		equ	$B3DF
wasmemoryerr		equ	$B3E0
inprotext		equ	$B3E1
