#!/bin/bash

SET JAVA_HOME="C:\Program Files\Java\jdk-11.0.12\bin"
SET PATH=%JAVA_HOME%;PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\Usuario\Desktop\Compi2\projects\Project1\CompiSound\TareaAST3D\src\tareaast3d
java -jar C:\Users\Usuario\Desktop\Compi2\projects\Project1\CompiSound\TareaAST3D\libraries\JFlex.jar lexer.jflex
pause
