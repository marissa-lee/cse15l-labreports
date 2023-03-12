CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'
TESTER='ListExamplesTests'
FILE='ListExamples'

if [[ $1 == 1 ]]
then 
    rm -rf lab7
    git clone https://github.com/marissa-lee/lab7.git
    cd lab7
    cp $TESTER.java $FILE.java ./lib
    cd lib
    javac -cp $CPATH *.java
    java -cp $CPATH org.junit.runner.JUnitCore $TESTER
elif [[ $1 == 2 ]]
then
    cd lab7/lib
    echo `pwd`
    echo `ls`
    javac -cp $CPATH *.java
    java -cp $CPATH org.junit.runner.JUnitCore $TESTER
    git add $FILE.java
    git commit -m "fix fail"
    git push origin main
fi
