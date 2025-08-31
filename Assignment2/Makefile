# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -O3 -std=c++17 -pthread -g -lpapi -funroll-loops -ftree-vectorize -march=native -fopt-info-vec-optimized
DIR1 = problem1-dir
DIR2 = problem2-dir
DIR3 = problem3-dir
# Target
TARGET1 = convolution.out
TARGET2 = reader.out
TARGET3= reader0.out
TARGET4= lock.out
./${DIR1}/$(TARGET1): ./${DIR1}/251110014-prob1.o
	$(CXX) $(CXXFLAGS)  -o ./${DIR1}/$(TARGET1) ./${DIR1}/251110014-prob1.o -lpapi

./${DIR2}/$(TARGET2): ./${DIR2}/251110014-prob2.o
	$(CXX) $(CXXFLAGS)  -o ./${DIR2}/$(TARGET2) ./${DIR2}/251110014-prob2.o

./${DIR2}/$(TARGET3): ./${DIR2}/rollno-prob2.o
	$(CXX) $(CXXFLAGS)  -o ./${DIR2}/$(TARGET3) ./${DIR2}/rollno-prob2.o

./${DIR3}/$(TARGET4): ./${DIR3}/251110014-prob3.o
	$(CXX) $(CXXFLAGS)  -o ./${DIR3}/$(TARGET4) ./${DIR3}/251110014-prob3.o
# Compile .cpp to .o
./${DIR1}/251110014-prob1.o: ./${DIR1}/251110014-prob1.cpp
	$(CXX) $(CXXFLAGS)  -c ./${DIR1}/251110014-prob1.cpp -o ./${DIR1}/251110014-prob1.o

./${DIR2}/251110014-prob2.o: ./${DIR2}/251110014-prob2.cpp
	$(CXX) $(CXXFLAGS)  -c ./${DIR2}/251110014-prob2.cpp -o ./${DIR2}/251110014-prob2.o

./${DIR2}/rollno-prob2.o: ./${DIR2}/rollno-prob2.cpp
	$(CXX) $(CXXFLAGS)  -c ./${DIR2}/rollno-prob2.cpp -o ./${DIR2}/rollno-prob2.o
./${DIR3}/251110014-prob3.o: ./${DIR3}/251110014-prob3.cpp
	$(CXX) $(CXXFLAGS)  -c ./${DIR3}/251110014-prob3.cpp -o ./${DIR3}/251110014-prob3.o
#


ls: 
	ls
# Clean up
clean:
	rm -f ./${DIR1}/$(TARGET1) *.o
	rm -f ./${DIR2}/$(TARGET2) *.o

run1 : ./${DIR1}/$(TARGET1)
	./${DIR1}/$(TARGET1) 1 8 8 

run2 : ./${DIR2}/$(TARGET2) 
	./${DIR2}/$(TARGET2) 5 ./prob2-test1/input

run2old: ./${DIR2}/$(TARGET3) 
	./${DIR2}/$(TARGET3) 5 ./prob2-test1/input
run3 : ./${DIR3}/$(TARGET4)
	./${DIR3}/$(TARGET4) 