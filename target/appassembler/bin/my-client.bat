@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\commons-io\commons-io\2.4\commons-io-2.4.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.5\slf4j-api-1.7.5.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.5\jcl-over-slf4j-1.7.5.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.5\jul-to-slf4j-1.7.5.jar;"%REPO%"\org\apache\logging\log4j\log4j-slf4j-impl\2.0\log4j-slf4j-impl-2.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-api\2.0\log4j-api-2.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-core\2.0\log4j-core-2.0.jar;"%REPO%"\org\eclipse\jetty\jetty-server\9.1.3.v20140225\jetty-server-9.1.3.v20140225.jar;"%REPO%"\javax\servlet\javax.servlet-api\3.1.0\javax.servlet-api-3.1.0.jar;"%REPO%"\org\eclipse\jetty\jetty-http\9.1.3.v20140225\jetty-http-9.1.3.v20140225.jar;"%REPO%"\org\eclipse\jetty\jetty-util\9.1.3.v20140225\jetty-util-9.1.3.v20140225.jar;"%REPO%"\org\eclipse\jetty\jetty-io\9.1.3.v20140225\jetty-io-9.1.3.v20140225.jar;"%REPO%"\org\eclipse\jetty\jetty-servlet\9.1.3.v20140225\jetty-servlet-9.1.3.v20140225.jar;"%REPO%"\org\eclipse\jetty\jetty-security\9.1.3.v20140225\jetty-security-9.1.3.v20140225.jar;"%REPO%"\org\glassfish\jersey\core\jersey-server\2.7\jersey-server-2.7.jar;"%REPO%"\org\glassfish\jersey\core\jersey-common\2.7\jersey-common-2.7.jar;"%REPO%"\org\glassfish\jersey\bundles\repackaged\jersey-guava\2.7\jersey-guava-2.7.jar;"%REPO%"\org\glassfish\hk2\osgi-resource-locator\1.0.1\osgi-resource-locator-1.0.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-client\2.7\jersey-client-2.7.jar;"%REPO%"\javax\ws\rs\javax.ws.rs-api\2.0\javax.ws.rs-api-2.0.jar;"%REPO%"\javax\annotation\javax.annotation-api\1.2\javax.annotation-api-1.2.jar;"%REPO%"\org\glassfish\hk2\hk2-api\2.2.0\hk2-api-2.2.0.jar;"%REPO%"\org\glassfish\hk2\hk2-utils\2.2.0\hk2-utils-2.2.0.jar;"%REPO%"\org\glassfish\hk2\external\aopalliance-repackaged\2.2.0\aopalliance-repackaged-2.2.0.jar;"%REPO%"\org\glassfish\hk2\external\javax.inject\2.2.0\javax.inject-2.2.0.jar;"%REPO%"\org\glassfish\hk2\hk2-locator\2.2.0\hk2-locator-2.2.0.jar;"%REPO%"\org\javassist\javassist\3.18.1-GA\javassist-3.18.1-GA.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-servlet-core\2.7\jersey-container-servlet-core-2.7.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-jetty-http\2.7\jersey-container-jetty-http-2.7.jar;"%REPO%"\org\eclipse\jetty\jetty-continuation\9.1.1.v20140108\jetty-continuation-9.1.1.v20140108.jar;"%REPO%"\org\glassfish\jersey\media\jersey-media-moxy\2.7\jersey-media-moxy-2.7.jar;"%REPO%"\org\glassfish\jersey\ext\jersey-entity-filtering\2.7\jersey-entity-filtering-2.7.jar;"%REPO%"\org\eclipse\persistence\org.eclipse.persistence.moxy\2.5.0\org.eclipse.persistence.moxy-2.5.0.jar;"%REPO%"\org\eclipse\persistence\org.eclipse.persistence.core\2.5.0\org.eclipse.persistence.core-2.5.0.jar;"%REPO%"\org\eclipse\persistence\org.eclipse.persistence.asm\2.5.0\org.eclipse.persistence.asm-2.5.0.jar;"%REPO%"\org\eclipse\persistence\org.eclipse.persistence.antlr\2.5.0\org.eclipse.persistence.antlr-2.5.0.jar;"%REPO%"\edu\aubg\upload-service\0.1.0\upload-service-0.1.0.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="my-client" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" edu.aubg.client.MyClient %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
