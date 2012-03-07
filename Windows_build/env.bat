@echo OFF
rem Windows 2000/XP build environment

rem This script sets up a default environment based on some installation
rem defaults. Wrap a command, for example in a shortcut like:
rem console.bat bash --login -i
rem or leave it blank to get to a shell.

rem Beware that batch syntax is weird:
rem		if /I "%PATH:Python=%" EQU "%PATH%"
rem This matches if "%PATH%" with _Python_ substituted by nothing
rem ("%PATH:Python=%") equals "%PATH%" -- in other words, Python is not in 
rem %PATH%.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::ENVIRONMENT VARIABLES::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem Pay attention when setting the following:
rem COMSPEC
rem EDITOR
rem GNUPGHOME
rem HOME
rem LANG
rem PATH
rem PATHEXT
rem PYTHONINPECT
rem PYTHONPATH
rem SHELL
rem TEMP
rem VISUAL

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@SETLOCAL ENABLEEXTENSIONS
	set params=%*
	if defined SESSIONNAME (title Starting %SESSIONNAME%) else (title Starting %params%) 
	rem set DEBUG (to something) here to see output
	rem set DEBUG=15
	if defined DEBUG (
		if /I "%PROMPT:DEBUG=%" EQU "%PROMPT%" set PROMPT=$CDEBUG$F$S%PROMPT%
		echo ERRORLEVEL: %ERRORLEVEL%
	)
	if exist "%HOME%\temp" (
		set TEMP=%HOME%\temp
	) else if exist "%HOME%\tmp" (
		set TEMP=%HOME%\tmp
	)
	set TMP=%TEMP%
	set TMPDIR=%TEMP%
	set USER=%USERNAME%
	
	rem Customize here for different possible shells
	if not defined SHELL (
		if defined MSYSCON (
			SHELL=%MSYSCON%
		) else (
			set SHELL=%ComSpec%
		)
	)
:::::::::::::::::::::::::::::::::DEFAULTS:::::::::::::::::::::::::::::::::
rem Note that quoting is different than shell (it is often not required). 
rem For example, less handles quotes in options specially. Also, %% is a 
rem literal % for DOS environment variables.
	if not defined MINGW32FGCOLOR (set MINGW32FGCOLOR=Navy)
	if not defined MINGW32BGCOLOR (set MINGW32BGCOLOR=White)

rem Verson control tranmitters spawn these wrappers in different ways: some
rem will take the -batch option and others won't.
rem (see notes on Cygwin rsync below)
	if not defined BZR_SSH (set BZR_SSH=plink.exe)
	if not defined CVS_RSH (set CVS_RSH=plink.exe -batch)
	if not defined GIT_SSH (set GIT_SSH=plink.exe)
	if not defined SVN_SSH (set SVN_SSH=plink.exe -batch)

rem CVSIGNORE already contains *~ and *.bak
	if not defined CVSIGNORE (set CVSIGNORE=*.tmp ~$*)
	if not defined EDITOR (set EDITOR=notepad.exe)
	if not defined LANG (set LANG=C)

rem Note that the LESS option --quit-if-one-screen/-F doesn't work with 
rem TERM cygwin. LESS erases it's portion of the screen after quitting. 
rem Also, the --quit-on-intr option is absent in DOS.
	if not defined LESS (set LESS=-eiqswJM --tabs=4 )
	if not defined PAGER (set PAGER=less)
	if not defined PLINK_PROTOCOL (set PLINK_PROTOCOL=ssh)
	rem gnu tar uses RSH and RSH_COMMAND
	if not defined RSH (set RSH=plink.exe -batch)
	rem gnu tar uses RSH_COMMAND to set the remote rsh filename
	if not defined VERSION_CONTROL (set VERSION_CONTROL=numbered)
	if not defined VISUAL (set VISUAL=%EDITOR%)
rem	if not defined XZ_DEFAULTS (set XZ_DEFAULTS=--memlimit=150MiB)

	if not defined CALENDAR_DIR if exist "%HOME%\.calendar" (
		set CALENDAR_DIR=%HOME%\.calendar
	)
	if not defined GNUPGHOME if exist "%HOME%\.gnupg" (
		set GNUPGHOME=%HOME%\.gnupg
	)
:::::::::::::::::::::::::::::INSTALLATION PATHS::::::::::::::::::::::::::::
rem MSYS/MinGW seems to be provided by several different packages. Some 
rem default installation paths are here. You can override these with
rem the environment variable MINGW_ROOT and CYGWIN_ROOT.
	if not defined CYGWIN_ROOT (set CYGWIN_ROOT=%SystemDrive%\cygwin)
	if not defined MINGW_ROOT (set MINGW_ROOT=%SystemDrive%\MinGW)
	
	rem Re-order here by preference
	if not exist "%MINGW_ROOT%" if exist "%ProgramFiles%\Git" (
		set MINGW_ROOT=%ProgramFiles%\Git
	) else if exist "%SystemDrive%\QtSDK\mingw" (
		set MINGW_ROOT=%SystemDrive%\QtSDK\mingw
	) else if exist "%SystemDrive%\Qt\2010.02\mingw" (
		set MINGW_ROOT=%SystemDrive%\Qt\2010.02\mingw
	)
	
rem unwind is http://unwind.dk/, formerly known as wintools, 
rem last released 2007-04-14 and development seems to have stopped.
	if not defined UNWIND_ROOT (set UNWIND_ROOT=%ProgramFiles%\unwind)
	rem parts of unwind:
	if not exist "%UNWIND_ROOT%" (
rem set standard installation paths if installed seperately:
rem GnuWin32 is http://gnuwin32.sourceforge.net/, last updated 27 December 2010.
rem The GnuWin32 installer is http://sourceforge.net/projects/getgnuwin32/files/, last updated 2010-07-05
		if not defined GNUWIN32_ROOT (set GNUWIN32_ROOT=%ProgramFiles%\GnuWin32)
rem SysInternals is http://technet.microsoft.com/en-us/sysinternals, last updated December 9, 2010
		if not defined SYSINTERNALS_ROOT (set SYSINTERNALS_ROOT=%ProgramFiles%\SysinternalsSuite)
rem UnxUtils is http://unxutils.sourceforge.net/, last updated 14-04-03
		if not defined UNXUTILS_ROOT (set UNXUTILS_ROOT=%SystemDrive%\UnxUtils)
	)
	
::::::::::::::::::::::::::::::::::::JAVA::::::::::::::::::::::::::::::::::
rem Search for Java 6, else assume SPSS provides a JRE
	if not defined JAVA_HOME (
		if exist "%ProgramFiles%\Java\jdk6" (
			set JAVA_HOME=%ProgramFiles%\Java\jdk6
		) else if exist "%ProgramFiles%\Java\jre6" (
			set JAVA_HOME=%ProgramFiles%\Java\jre6
		) else if exist "%ProgramFiles%\IBM\SPSS\Statistics\20\JRE" (
			set JAVA_HOME=%ProgramFiles%\IBM\SPSS\Statistics\20\JRE
		)
	)
::::::::::::::::::::::::::::::::OBJECT PATHS::::::::::::::::::::::::::::::
	if exist "%HOME%\bin" set myPATH=%myPATH%;%HOME%\bin
rem AHK scripts will look in this directory:
	if exist "%HOME%\AutoHotKey" set myPATH=%myPATH%;%HOME%\AutoHotKey
	
rem Java classpath is ; delimited
	if not defined CLASSPATH if exist "%HOME%\java" (
		set CLASSPATH=%HOME%\java
	)
	
rem Python path is ; seperated on Windows, : seperated on others
	if exist %HOME%\python (set PYTHONPATH=%PYTHONPATH%;%HOME%\python)
	if exist %APPDATA%\Python\Scripts (set PYTHONPATH=%PYTHONPATH%;%APPDATA%\Python\Scripts)
	
::::::::::::::::::::::::::::::DOSKEY::::::::::::::::::::::::::::::::::::::
rem Done before changing directory (below) so that MACROFILE can refer to a
rem relative path.
	if exist "%MACROFILE%" (
		doskey /MACROFILE=%MACROFILE%
	)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if exist "%CD%\bin" set myPATH=%myPATH%;%CD%\bin
	
rem change to your preferred working directory
	rem cd /D "%HOME%"
	cd /D "%TEMP%"
::::::::::::::::::::::::::::::::PYTHON::::::::::::::::::::::::::::::::::::
rem Rearrange this section to your taste, or set a Python directory in
rem your path. The stock CPython installer puts itself in PATH.
rem Python 2.7 is required by SPSS 20, Python 2.6 is provided by ArcGIS, and 
rem 2.5 is required by old versions of SPSS.
	if /I "%PATH:Python=%" EQU "%PATH%" (
		       if exist	"%SystemDrive%\Python27\python.exe" (
			set myPATH=%myPATH%;%SystemDrive%\Python27;%SystemDrive%\Python27\Scripts
		) else if exist	"%SystemDrive%\Python26\python.exe" (
			set myPATH=%myPATH%;%SystemDrive%\Python26;%SystemDrive%\Python26\Scripts
		) else if exist	"%SystemDrive%\Python26\ArcGIS10.0\python.exe" (
			set myPATH=%myPATH%;%SystemDrive%\Python26\ArcGIS10.0;%SystemDrive%\Python26\ArcGIS10.0\Scripts
		) else if exist	"%SystemDrive%\Python32\python.exe" (
			set myPATH=%myPATH%;%SystemDrive%\Python32;%SystemDrive%\Python32\Scripts
		) else if exist	"%SystemDrive%\Python25\python.exe" (
			set myPATH=%myPATH%;%SystemDrive%\Python25;%SystemDrive%\Python25\Scripts
		)
	)
rem Inkspace has a built-in python, but no Scripts/
	if /I "%PATH:Python=%" EQU "%PATH%" (
		if exist		"%ProgramFiles%\Inkscape" (
			set myPATH=%myPATH%;%ProgramFiles%\Inkscape\python
		)
	)
rem Next, try OpenOffice (provides Python sometimes)
	if /I "%PATH:Python=%" EQU "%PATH%" if exist "%ProgramFiles%\OpenOffice.org 3\program\python.exe" (
		set myPATH=%myPATH%;%ProgramFiles%\OpenOffice.org 3\program
		rem and keeps Scripts in a weird place
		if exist "%APPDATA%\OpenOffice.org 3\user\Scripts\python" (
			myPATH=%myPATH%;%APPDATA%\OpenOffice.org 3\user\Scripts\python
		)
	)
rem IronPython doesn't provide a python.exe, rather ipy.exe, and can
rem import from the CPython standard library.
rem IronPython 2.6 is used for compatibility reasons. Note that 2.7 is
rem still in alpha.
	if /I "%PATH:IronPython=%" EQU "%PATH%" (
		       if exist "%ProgramFiles%\IronPython 2.6 for .NET 4.0" (
			set myPATH=%myPATH%;%ProgramFiles%\IronPython 2.6 for .NET 4.0;%ProgramFiles%\IronPython 2.6 for .NET 4.0\Tools\Scripts
			if exist "%SystemDrive%\Python26" (
				set IRONPYTHONPATH=%PYTHONPATH%;%SystemDrive%\Python26;%SystemDrive%\Python26\Lib\site-packages
			)
		) else if exist "%ProgramFiles%\IronPython 2.7" (
			set myPATH=%myPATH%;%ProgramFiles%\IronPython 2.7;%ProgramFiles%\IronPython 2.7\Tools\Scripts
			if exist "%SystemDrive%\Python27" (
				set IRONPYTHONPATH=%PYTHONPATH%;%SystemDrive%\Python27;%SystemDrive%\Python27\Lib\site-packages
			)
		)
	)
::::::::::::::::::::::::::::::CYGWIN OPTIONS::::::::::::::::::::::::::::::
rem Cygwin-linked programs will barf a message about pathname 
rem compatibility without this:
	set CYGWIN=nodosfilewarning %CYGWIN%
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::PATH:::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem Locate32: http://locate32.net/content/view/18/31/
rem If using Locate, it should go ahead of any GNU locate(s)
	if exist "%ProgramFiles%\Locate" set myPATH=%myPATH%;%ProgramFiles%\Locate
::::::::::::::::::::::::::::::::::TOOLKITS::::::::::::::::::::::::::::::::
rem Change the order of toolkits here to suit personal preference 
rem (decreasing priority). The Unwind package installs some of these as a
rem bundle.
	if exist "%SYSINTERNALS_ROOT%" set myPATH=%myPATH%;%SYSINTERNALS_ROOT%
rem Windows has it's own java.exe someplace, likely overriding your java
	if exist "%JAVA_HOME%" set myPATH=%myPATH%;%JAVA_HOME%\bin
	if exist "%MINGW_ROOT%" set myPATH=%myPATH%;%MINGW_ROOT%\bin
rem MSYS is the hierarchy of user programs that are a companion to the
rem MinGW build kit, but not necessarily in PATH.
	if exist "%SystemDrive%\MSYS" (
		set myPATH=%myPATH%;%SystemDrive%\MSYS\1.0\bin
	) else if exist "%MINGW_ROOT%\MSYS" (
		set myPATH=%myPATH%;%MINGW_ROOT%\MSYS
	)
rem unwind installs gnuwin32
	if exist "%GNUWIN32_ROOT%" (set myPATH=%myPATH%;%GNUWIN32_ROOT%\bin;%GNUWIN32_ROOT%\sbin)
	if exist "%CYGWIN_ROOT%" (
		set myPATH=%myPATH%;%CYGWIN_ROOT%\bin;%CYGWIN_ROOT%\usr\sbin
	)
rem unwind used to install unxutils
	if exist "%UNXUTILS_ROOT%" (set myPATH=%myPATH%;%UNXUTILS_ROOT%\bin;%UNXUTILS_ROOT%\usr\local\wbin)
	if exist "%UNWIND_ROOT%" (
		set myPATH=%myPATH%;%UNWIND_ROOT%\bindutils;%UNWIND_ROOT%\getwin32\bin;%UNWIND_ROOT%\misctools;%UNWIND_ROOT%\putty
	)
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::R::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem Tune this for the latest version of R
rem R version 2.12.1 required by SPSS 20
	if exist "%ProgramFiles%\R\R-2.12.1" (
		set myPATH=%myPATH%;%ProgramFiles%\R\R-2.12.1\bin
	) else if exist "%ProgramFiles%\R\R-2.7.2" (
rem R version 2.7.2 required by SPSS 17
		set myPATH=%myPATH%;%ProgramFiles%\R\R-2.7.2\bin
	)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::WINDOWS SYSTEM TOOLS::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem unquoted parentheses in variables will choke PATH, and also not get 
rem translated correctly in Cygwin and MSYS
	if exist "%ProgramFiles%\Debugging Tools for Windows (x86)" set myPATH=%myPATH%;%ProgramFiles%\"Debugging Tools for Windows (x86)"
	if exist "%ProgramFiles%\Microsoft SDKs\Windows\v7.0" set myPATH=%myPATH%;%ProgramFiles%\Microsoft SDKs\Windows\v7.0\bin
	if exist "%ProgramFiles%\Microsoft SDKs\Windows\v6.0" set myPATH=%myPATH%;%ProgramFiles%\Microsoft SDKs\Windows\v6.0\bin
	if exist "%ProgramFiles%\Microsoft Visual Studio 9.0\VC" set myPATH=%myPATH%;%ProgramFiles%\Microsoft Visual Studio 9.0\VC\bin
	if exist "%ProgramFiles%\Support Tools" set myPATH=%myPATH%;%ProgramFiles%\Support Tools
	if exist "%ProgramFiles%\Windows Resource Kits\Tools" set myPATH=%myPATH%;%ProgramFiles%\Windows Resource Kits\Tools
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::MISCELLANEOUS IN PATH::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem Additional software useful on the command-line is assumed to be in
rem default installation directories.
	
	if exist "%ProgramFiles%\7-zip" set myPATH=%myPATH%;%ProgramFiles%\7-zip
	if /I "%PATH:Bazaar=%" EQU "%PATH%" if exist "%ProgramFiles%\Bazaar" set myPATH=%myPATH%;%ProgramFiles%\Bazaar
rem unwind installs CVSNT
	if /I "%PATH:CVS=%" EQU "%PATH%" if exist "%ProgramFiles%\CVSNT" set myPATH=%myPATH%;%ProgramFiles%\CVSNT
rem unwind might install GnuPG, but check for the latest official version
rem GnuPG 2 has two directories of executables
	if exist "%ProgramFiles%\GNU\GnuPG\gpg2.exe" set myPATH=%myPATH%;%ProgramFiles%\GNU\GnuPG\pub
	if exist "%ProgramFiles%\GNU\GnuPG" set myPATH=%myPATH%;%ProgramFiles%\GNU\GnuPG
	if exist "%ProgramFiles%\ImgBurn" set myPATH=%myPATH%;%ProgramFiles%\ImgBurn
	if exist "%ProgramFiles%\IrfanView" set myPATH=%myPATH%;%ProgramFiles%\IrfanView
	
rem Some old bundles include an rsync built with an incompatible cygwin1.dll.
rem These should be activated only in MinGW/MSYS. The Cygwin installer has an
rem rsync package.
rem Beware that CopSSH is a SSH server -- misconfigured and without a firewall
rem it could become a backdoor.
	if not exist "%CYGWIN_ROOT%" (
		if exist "%ProgramFiles%\ICW" set myPATH=%myPATH%;%ProgramFiles%\ICW\bin
		if exist "%ProgramFiles%\cwRsync" set myPATH=%myPATH%;%ProgramFiles%\cwRsync\bin
		if exist "%ProgramFiles%\hardBackup" set myPATH=%myPATH%;%ProgramFiles%\hardBackup
	)
	
rem OpenVPN provides openssl
	if exist "%ProgramFiles%\OpenVPN" set myPATH=%myPATH%;%ProgramFiles%\OpenVPN\bin
rem WinSCP can provide pageant and puttygen
	if exist "%ProgramFiles%\PuTTY" (
		set myPATH=%myPATH%;%ProgramFiles%\PuTTY
	) else if exist "%ProgramFiles%\WinSCP\PuTTY" (
		set myPATH=%myPATH%;%ProgramFiles%\WinSCP\PuTTY
	)
	if exist "%ProgramFiles%\Nmap" set myPATH=%myPATH%;%ProgramFiles%\Nmap
	if exist "%ProgramFiles%\Notepad++" set myPATH=%myPATH%;%ProgramFiles%\Notepad++
	if exist "%ProgramFiles%\smartmontools" set myPATH=%myPATH%;%ProgramFiles%\smartmontools\bin
rem for Subversion, see http://www.open.collab.net/downloads/subversion/
rem VMware comes with zip, unzip and mkisofs
	if exist "%ProgramFiles%\VMware\VMware Player" set myPATH=%myPATH%;%ProgramFiles%\VMware\VMware Player
	if exist "%ProgramFiles%\WinDirStat" set myPATH=%myPATH%;%ProgramFiles%\WinDirStat
	if exist "%ProgramFiles%\WinMerge-2.12.4" set myPATH=%myPATH%;%ProgramFiles%\WinMerge-2.12.4
	
	if defined myPATH (
		rem myPATH begins with a superflous ; so the below is not a typo
		set oldPATH=%PATH%
		set PATH=%PATH%%myPATH%
	)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::PATHEXT::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem Files with these extensions are assumed to be executable by their
rem interpreter.
	if not defined PATHEXT (
		set PATHEXT=".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH" 
	)
	set PATHEXT=%PATHEXT%;.ahk;.awk;.bash;.csh;.ipy;.jar;.pl;.py;.pyw;.sh;.tcsh
rem Note that %PATHEXT:%%e;=% doesn't substitute %e inside a loop
rem This will work:
rem if /I "%PATHEXT:.ahk;=%" EQU "%PATHEXT%" (set myPATHEXT=%myPATHEXT%;.ahk)
rem This will not:
rem if /I "%PATHEXT:%e%;=%" EQU "%PATHEXT%" (set myPATHEXT=%myPATHEXT%;%e%)
	
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::EXECUTION::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	if defined DEBUG PATH
	
rem Uncomment this line (and comment the one further down) if you want to
rem trap based on exit status.
rem if defined params (call %params%) else (call %SHELL%) || @pause
rem	if defined params (call %params%) else (call %SHELL%)
	if defined params (start %params%) else (start %SHELL%)
	@if defined DEBUG @pause
@ENDLOCAL
exit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::END:::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::