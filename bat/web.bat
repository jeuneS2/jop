cd ..\..
xcopy /s jop \tmp\jop\
cd \tmp\jop
for /R . %%x IN (.) DO call max_del %%x
cd \tmp\jop
for /R . %%x IN (*.bin) DO del %%x
for /R . %%x IN (*.ttf) DO del %%x
for /R . %%x IN (*.sof) DO del %%x
cd java\target\app
del /s/q kfl
del /s/q oebb
cd \tmp
rem start /w \programme\winzip\winzip32 -a jop.zip -r jop
