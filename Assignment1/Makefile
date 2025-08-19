# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -pthread -g -O0

# Target
TARGET = file_processor.out

# Build target
$(TARGET): 251110014.o
	$(CXX) $(CXXFLAGS)  -o $(TARGET) 251110014.o

# Compile .cpp to .o
251110014.o: 251110014.cpp
	$(CXX) $(CXXFLAGS)  -c 251110014.cpp

# Clean up
clean:
	rm -f $(TARGET) *.o
	rm -f ./output.txt

run : $(TARGET)
	./$(TARGET) ./input.txt 4 3 6 10 ./output.txt