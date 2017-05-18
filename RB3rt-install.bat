set "origin=%cd%"

set "tmp=%Temp%\rb3rt-install"
if not exist "%tmp%" mkdir %tmp%"
cd %tmp%

set "wget=%tmp%\wget.exe"
bitsadmin.exe /transfer "Downloading wget" https://eternallybored.org/misc/wget/current/wget64.exe %wget%

%wget% http://www.7-zip.org/a/7z1604-x64.exe -O 7z-setup.exe
7z-setup.exe /S
set "unzip=C:\Program Files\7-Zip\7z"

%wget% https://go.microsoft.com/fwlink/?LinkID=623230 -O vscode.exe
vscode.exe /SILENT
set "vscode=C:\Program Files (x86)\Microsoft VS Code\bin\code"
cmd /c "%vscode%" --install-extension ms-vscode.cpptools

%wget% https://cygwin.com/setup-x86_64.exe -O cygwin.exe
cygwin.exe -q -s http://www.gutscheinrausch.de/mirror/cygwin/ -P make,diffutils-3.5-2,perl,git,gcc-core,gcc-g++,libboost-devel,curl 

wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-win32.exe -O gcc-arm-none-eabi-toolchain.exe
gcc-arm-none-eabi-toolchain.exe 

wget https://bitbucket.org/Tasssadar/lorris_binaries/raw/b482b371fe2e08a28c1144563cde06558586bf66/Lorris.zip -O Lorris.zip
"%unzip%" x Lorris.zip -oC:\Lorris

wget http://files.robotikabrno.cz/RB3rt.zip
"%unzip%" x RB3rt.zip -oC:\

wget http://files.robotikabrno.cz/RB3rt-project.zip
"%unzip%" x RB3rt-project.zip -oC:\

wget http://files.robotikabrno.cz/RB3rt-image.zip
"%unzip%" x RB3rt-image.zip -oC:\


cd %origin%
@RD /S /Q %tmp%
